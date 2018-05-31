class Location < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :phone_number, presence: true 
end
