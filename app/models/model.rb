class Model < ApplicationRecord
  belongs_to :brand
  belongs_to :category

  validates :name, presence: true, uniqueness: { case_sensitive: false }
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

end
