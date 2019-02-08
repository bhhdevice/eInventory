class Log < ApplicationRecord
  validates :processed_by, presence: true
  validates :past_record, presence: true
  validates :past_user, presence: true, allow_blank: true
end
