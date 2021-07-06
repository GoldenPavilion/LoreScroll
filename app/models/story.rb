class Story < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :user}
    
    belongs_to :user 
    has_many :characters 
    has_many :worlds, -> {distinct}, through: :characters
    has_many :story_genres
    has_many :genres, through: :story_genres
    accepts_nested_attributes_for :genres

    scope :most_recent, -> {order('created_at DESC')}
end
