class Movie < ApplicationRecord
  belongs_to :character
  has_many :genres
  validates :title, :creation_date, :rating, :character_id, :presence => true
end
