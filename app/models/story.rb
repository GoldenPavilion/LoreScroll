class Story < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :world, optional: true
    has_many :story_genres
    has_many :genres, through: :story_genres
end
