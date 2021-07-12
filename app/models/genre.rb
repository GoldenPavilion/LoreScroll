class Genre < ApplicationRecord
    validates :name, uniqueness: true
    
    has_many :story_genres
    has_many :stories, through: :story_genres
end
