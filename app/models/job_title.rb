class JobTitle < ApplicationRecord
  has_many :users
  before_save :format_data
  before_destroy :create_log

  validates :name, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A^[a-z A-Z]*$\z/i }

  def to_s
    "#{name}"
  end

  private
    def format_data
      self.name = self.name.downcase.titleize
    end
end
