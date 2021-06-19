class World < ApplicationRecord
    has_many :stories
    has_many :users, through: :stories
    has_many :characters
end
