class Stock < ApplicationRecord
  belongs_to :item, polymorphic: true
  belongs_to :category, optional: true

  validates :category, presence: true, uniqueness: true, allow_blank: true
  validates :total, presence: true, numericality: true
  validates :available, presence: true, numericality: true
  validates :in_use, presence: true, numericality: true

  def to_s
    "#{category.name} - Total: #{total} - Available: #{available} - In-Use: #{in_use}"
  end

  def update
    self.total = self.item.equipment.count
    self.in_use = Assignment.where(equipment: self.item.equipment).count
    self.available = self.total - self.in_use
    self.save
  end

  #only use in emergency cases where troubleshooting the inventory does not make sense
  def self.reset
    Stock.destroy_all
    Brand.all.each do |brand|
      s = Stock.find_or_create_by(item: brand)
      s.update
    end
    Model.all.each do |model|
      s = Stock.find_or_create_by(item: model, category: model.category)
      s.update
    end
  end
end
