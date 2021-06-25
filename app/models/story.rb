class Story < ApplicationRecord
    validates :title, presence: true 
    
    belongs_to :user 
    has_many :characters 
    has_many :worlds, through: :characters
    has_many :story_genres
    has_many :genres, through: :story_genres
end
