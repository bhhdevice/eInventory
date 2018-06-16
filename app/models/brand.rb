class Brand < ApplicationRecord
  before_save :format_data

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true, uniqueness: { case_sensitive: false }
  validates :state, presence: true, length: { is: 2 }, inclusion: { in: HomeHelper::STATES.values }
  validates :city, presence: true
  validates :zip_code, presence: true, format: { with: /\A\d{5}(?:[-\s]\d{4})?\z/i }
  validates :phone_number, presence: true, format: { with: /\A(\d{1,2}\-)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/i }
  validates :website, presence: true, format: { with: URI::regexp(%w(http https)) }

  private
    def format_data
      self.name = self.name.downcase.titleize
      self.city = self.city.capitalize
      self.address = self.address.downcase.titleize
      self.website = self.website.downcase
    end
end
