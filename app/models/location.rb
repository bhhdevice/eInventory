class Location < ApplicationRecord
  has_many :users
  before_save :format_data

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }, inclusion: { in: HomeHelper::STATES.values }
  validates :zip_code, presence: true, format: { with: /\A\d{5}(?:[-\s]\d{4})?\z/i }
  validates :phone_number, presence: true, format: { with: /\A(\d{1,2}\-)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/i }

  private

    def format_data
      self.name = self.name.downcase.titleize
      self.city = self.city.downcase.titleize
      self.address = self.address.downcase.titleize
    end
end
