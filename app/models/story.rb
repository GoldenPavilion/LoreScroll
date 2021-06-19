class Story < ApplicationRecord
    belongs_to :user
    belongs_to :world
    has_many :story_genres
    has_many :genres, through: :story_genres
end
