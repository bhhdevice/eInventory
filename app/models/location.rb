class Location < ApplicationRecord
  has_many :users
  before_save :format_data

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip_code, presence: true, length: { is: 5 }
  validates :phone_number, presence: true

  private

    def format_data
      self.name = self.downcase.titleize
      self.city = self.city.capitalize
      self.address = self.address.downcase.titleize
    end
end
