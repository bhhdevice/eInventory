class Status < ApplicationRecord
  has_many :users
  has_many :employees

  validates :name, presence: true, uniqueness: true
end
