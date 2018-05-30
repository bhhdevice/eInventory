class Department < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :cost_center, presence: true, length: { is: 4 }
end
