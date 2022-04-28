class Genre < ApplicationRecord
  belongs_to :movie
  validates :movie_id, :name, :presence => true
end
