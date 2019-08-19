class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department
  belongs_to :location
  belongs_to :job_title
  belongs_to :status
  belongs_to :reports_to, class_name: 'User', foreign_key: 'reports_to_id', optional: true
  has_many :assignments, dependent: :destroy
  before_destroy :create_log
  after_initialize :set_defaults
  before_save :format_data

  validates :first_name, presence: true, format: { with: /[a-zA-z]\z/i }
  validates :last_name, presence: true, format: { with: /[a-zA-z]\z/i }
  validates :job_title, presence: true
  validates :employee_number, presence: true, uniqueness: { case_sensitive: false }, length: { is: 7 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :department, presence: true
  validates :location, presence: true
  validates :address, presence: true, allow_blank: true
  validates :state, presence: true, allow_blank: true, length: { is: 2 }, inclusion: { in: ApplicationHelper::STATES.values }
  validates :city, presence: true, allow_blank: true
  validates :zip_code, presence: true, allow_blank: true, format: { with: /\A\d{5}(?:[-\s]\d{4})?\z/i }
  validates :phone_number, presence: true, allow_blank: true, format: { with: /\A(\d{1,2}\-)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/i }
  validates :reports_to, presence: true, allow_blank: true
  validates :status, presence: true
  validates_inclusion_of :disable_login, in: [true, false]
  validates_inclusion_of :admin, in: [true, false]

  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.import(file)
    row_log = { notices: [], log: ["Type - #{self.name} Import"] }
    begin
      spreadsheet = Roo::Spreadsheet.open(file.path)
      if (spreadsheet.last_row - spreadsheet.first_row) > 100
        row_log[:log] << "#{file.original_filename} exceeds 100 rows"
        row_log[:notices] << "#{file.original_filename} exceeds 100 rows"
        return row_log
      end
    rescue ArgumentError
      row_log[:log] << "Bad file type."
      row_log[:notices] << "Bad file type."
      return row_log
    rescue NoMethodError
      row_log[:log] << "No file attached."
      row_log[:notices] << "No file attached."
      return row_log
    else
      header = spreadsheet.row(1).map { |r| r.downcase.gsub(" ", "_")}
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        user = User.find_by(id: row["id"]) || new
        begin
          user.password = "Pa$$word"
          user.password_confirmation = "Pa$$word"
          row["location"] = Location.where("name ILIKE ?", "%#{row["location"]}%").first
          row["department"] = Department.where("name ILIKE ?", "%#{row["department"]}%").first
          row["job_title"] = JobTitle.where("name ILIKE ?", "%#{row["job_title"]}%").first
          row["reports_to"] = User.managers.where("employee_number = ?", "%#{row["reports_to"]}%").first
          user.disable_login = true
          user.attributes = row.to_hash
          user.save!
        rescue ActiveRecord::AssociationTypeMismatch
        rescue ActiveModel::UnknownAttributeError => e
          row_log[:log] << "Unknown Attribute ROW (#{i})"
          row_log[:notices] << "Error on row (#{i})"
        rescue ActiveRecord::RecordInvalid => e
          row_log[:log] << "Invalid Data ROW (#{i})"
          row_log[:notices] << "Error on row (#{i})"
        end
        if row_log[:notices].length > 50
          row_log[:log] << "Job Terminated, too many data errors, revise #{file.original_filename}"
          row_log[:notices] << "Job Terminated, too many data errors, revise #{file.original_filename}"
          return row_log
        end
      end
      if row_log[:notices].length <= 0
        row_log[:log] << "Successful"
        row_log[:notices] << "Successful"
      end
      row_log[:log] << "#{file.original_filename}"
      row_log[:notices] << "#{file.original_filename}"
      return row_log
    end
  end

  def self.to_csv(options = {})
    desired_columns = ["first_name", "last_name", "department", "location"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |user|
        row = []
        desired_columns.each do |c|
          result = user.send(c)
          if result.instance_of? String
            row << result
          else
            row << result.name
          end
        end
        csv << row
      end
    end
  end



  def full_name
    "#{first_name} #{last_name}"
  end

  def self.managers
    joins(:job_title).where("job_titles.name ILIKE ? OR job_titles.name ILIKE ?", "%Manager%", "%Director%")
  end

  def to_s
    "#{full_name} - #{employee_number} - Phone: #{phone_number}"
  end

  protected

  def send_reset_password_instructions
    if self.status.name == 'Terminated' || self.status.name == 'Resigned' || self.disable_login
      return false
    end
    super
  end

  private

  def set_defaults
    self.status ||= Status.find_by_name('Active')
  end

  def format_data
    self.employee_number = self.employee_number.upcase
    self.first_name = self.first_name.downcase.titleize
    self.last_name = self.last_name.downcase.titleize
    self.email = self.email.downcase
    self.city.nil? ? nil : self.city = self.city.downcase.titleize
    self.address.nil? ? nil : self.address = self.address.downcase.titleize
  end
end
