class Character < ApplicationRecord
    validates :name, presence: true, uniqueness: {scope: :story}
    
    belongs_to :world
    belongs_to :story

    scope :order_by_name, -> {order('name ASC')}
    scope :order_by_role, -> {order(:role)}
    scope :main_characters, -> {where(role: "Main Character").limit(8).order_by_name}
end
