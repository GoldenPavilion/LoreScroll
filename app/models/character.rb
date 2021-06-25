class Character < ApplicationRecord
    validates :name, presence: true
    validates :world_id, presence: true
    validates :story_id, presence: true
    
    belongs_to :world
    belongs_to :story
end
