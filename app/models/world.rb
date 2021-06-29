class World < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :user}
    
    belongs_to :user
    has_many :characters
    has_many :stories, through: :characters

    scope :most_recent, -> {order('created_at DESC')}
end
