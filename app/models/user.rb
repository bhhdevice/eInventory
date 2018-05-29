class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :department
  belongs_to :location
  belongs_to :job_title

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title_id, presence: true
  validates :employee_number, presence: true, uniqueness: true
  validates :department_id, presence: true
  validates :location_id, presence: true
  validates_inclusion_of :active, in: [true, false]
  validates_inclusion_of :admin, in: [true, false]
  validates_inclusion_of :manager, in: [true, false]

  def reports_to
    User.find(self.reports_to_id)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.managers
    where(manager: true)
  end
end
