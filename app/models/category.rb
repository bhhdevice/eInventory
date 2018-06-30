class Category < ApplicationRecord
  has_many :models, dependent: :destroy
  before_save :format_data

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
    def format_data
      self.name = self.name.downcase.titleize
    end
end
