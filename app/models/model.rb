class Model < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :equipment, dependent: :destroy
  has_one :stock, as: :item, dependent: :destroy
  before_destroy :create_log
  before_save :format_data
  after_save :create_stock

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :number, presence: true, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :release_date, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :processor, presence: true, allow_blank: true
  validates :ram, presence: true, allow_blank: true
  validates :storage_capacity, presence: true, allow_blank: true
  validates :storage_type, presence: true, allow_blank: true
  validates :display, presence: true, allow_blank: true
  validates :battery_capacity, presence: true, allow_blank: true
  validates :wifi, presence: true, allow_blank: true
  validates :bluetooth, presence: true, allow_blank: true
  validates :gps, presence: true, allow_blank: true
  validates :cellular, presence: true, allow_blank: true
  validates :camera, presence: true, allow_blank: true
  validates :size, presence: true, allow_blank: true
  validates :weight, presence: true, allow_blank: true
  validates :website, presence: true, format: { with: URI::regexp(%w(http https)) }, allow_blank: true

  def to_s
    "#{brand.name} #{name} - #{number}"
  end

  private
    def format_data
      self.number.nil? ? nil : self.number = self.number.upcase
      self.weight.nil? ? nil : self.weight = self.weight.downcase
      self.website.nil? ? nil : self.website = self.website.downcase
    end

    def create_stock
      stock = Stock.find_or_create_by(item: self)
      if stock.present?
        stock.category = self.category
        stock.save
      end
    end
end
