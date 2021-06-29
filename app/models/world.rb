class World < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :user}
    
    belongs_to :user
    has_many :characters
    has_many :stories, through: :characters
end
