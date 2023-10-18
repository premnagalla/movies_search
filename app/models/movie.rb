class Movie < ApplicationRecord
  validates :title, presence: true
  validates :api_id, presence: true, uniqueness: true
end
