class Stock < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :category, optional: true

  validates :category, presence: true, uniqueness: true, allow_blank: true
  validates :total, presence: true, numericality: true
  validates :available, presence: true, numericality: true
  validates :in_use, presence: true, numericality: true


  def update
    self.total = self.item.equipment.count
    self.in_use = Assignment.where(equipment: self.item.equipment).count
    self.available = self.total - self.in_use
    self.save
  end
end
