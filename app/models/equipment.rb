class Equipment < ApplicationRecord
  belongs_to :brand
  belongs_to :model
  after_create :update_stock
  after_update :update_stock
  after_destroy :update_stock

  validates :brand, presence: true
  validates :model, presence: true
  validates :asset_tag, presence: true, uniqueness: true, numericality: true, length: { is: 6 }, allow_blank: true
  validates :hostname, presence: true, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :serial_number, presence: true, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :phone_number, presence: true, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :sim_number, presence: true, uniqueness: true, numericality: true, length: { is: 20 }, allow_blank: true
  validates :imei, presence: true, uniqueness: true, numericality: true, length: { is: 15 }, allow_blank: true
  validates :device_number, presence: true, uniqueness: true, numericality: true, length: { is: 15 }, allow_blank: true
  validate :model_brand_ok?


  def category
    return model.category unless model.blank?
  end

  private

    def update_stock
      self.brand.stock.update
      self.model.stock.update
    end

    def model_brand_ok?
      return nil unless self.brand.present? && self.model.present?
      if self.brand === self.model.brand
        return true
      else
        errors.add(:model, "selection does not exist for brand")
        return false
      end
    end
end
