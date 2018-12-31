class Department < ApplicationRecord
  has_many :users
  before_save :format_data
  before_destroy :create_log

  validates :name, presence: true
  validates :cost_center, presence: true, length: { is: 4 }

  def to_s
    "#{name} - Cost Center: #{cost_center}"
  end

  private
    def format_data
      self.name = self.name.downcase.titleize
      self.cost_center = self.cost_center.gsub(/\s+/, '').upcase
    end
end
