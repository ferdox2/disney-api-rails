class Character < ApplicationRecord
    has_many :movies
    validates :name, :age, :weight, :history, :presence => true
end
