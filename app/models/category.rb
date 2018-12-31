class Category < ApplicationRecord
  has_many :models, dependent: :destroy
  has_many :stock
  has_many :equipment
  before_destroy :create_log
  before_save :format_data

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def to_s
    "#{name}"
  end

  private
    def format_data
      self.name = self.name.downcase.titleize
    end
end
