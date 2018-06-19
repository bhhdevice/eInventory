class Brand < ApplicationRecord
  has_many :models, dependent: :destroy
  before_save :format_data

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :address, presence: true, allow_blank: true
  validates :state, presence: true, length: { is: 2 }, inclusion: { in: HomeHelper::STATES.values }, allow_blank: true
  validates :city, presence: true, allow_blank: true
  validates :zip_code, presence: true, format: { with: /\A\d{5}(?:[-\s]\d{4})?\z/i }, allow_blank: true
  validates :phone_number, presence: true, format: { with: /\A(\d{1,2}\-)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/i }, allow_blank: true
  validates :website, presence: true, format: { with: URI::regexp(%w(http https)) }, allow_blank: true
  validates :email, presence: true, allow_blank: true

  private
    def format_data
      self.name = self.name.downcase.titleize
      self.city.nil? ? nil : self.city = self.city.downcase.titleize
      self.address.nil? ? nil : self.address = self.address.downcase.titleize
      self.website.nil? ? nil : self.website = self.website.downcase
    end
end
