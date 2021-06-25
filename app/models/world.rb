class World < ApplicationRecord
    belongs_to :user
    has_many :characters
    has_many :stories, through: :characters
end
