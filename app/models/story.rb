class Story < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: :user}
    
    belongs_to :user 
    has_many :characters, dependent: :destroy 
    has_many :worlds, -> {distinct}, through: :characters
    has_many :story_genres
    has_many :genres, through: :story_genres
    accepts_nested_attributes_for :genres

    scope :most_recent, -> {order('created_at DESC')}

    def genres_attributes=(genre_attributes)
        genre_name = genre_attributes["0"]["name"]
        unless genre_name.blank?
            genre = Genre.find_or_create_by(name: genre_name)
            self.genres << genre
        end
    end
end
