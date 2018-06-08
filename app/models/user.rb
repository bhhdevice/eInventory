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
  after_initialize :set_default_status

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :employee_number, presence: true, uniqueness: true, length: { is: 7 }
  validates :department, presence: true
  validates :location, presence: true
  validates :address, presence: true, allow_blank: true
  validates :state, presence: true, allow_blank: true, length: { is: 2 }
  validates :city, presence: true, allow_blank: true
  validates :zip_code, presence: true, allow_blank: true, length: { is: 5 }
  validates :phone_number, presence: true, allow_blank: true
  validates :reports_to, presence: true, allow_blank: true
  validates :status, presence: true
  validates_inclusion_of :disable_login, in: [true, false]
  validates_inclusion_of :admin, in: [true, false]
  validates_inclusion_of :manager, in: [true, false]

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.managers
    where(manager: true)
  end

  protected

  def send_reset_password_instructions
    if self.status.name == 'Terminated' || self.status.name == 'Resigned' || self.disable_login
      return false
    end
    super
  end

  private

  def set_default_status
    self.status ||= Status.find_by_name('Active')
  end
end
