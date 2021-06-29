class Character < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :story}
    validates :world_id, presence: true
    validates :story_id, presence: true
    
    belongs_to :world
    belongs_to :story

    scope :order_by_role, -> {order(:role)}
    scope :main_characters, -> {where(role: "Main Character").limit(5).order('name asc')}
end
