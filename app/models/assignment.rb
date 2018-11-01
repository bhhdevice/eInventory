class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :equipment, uniqueness: true
end
