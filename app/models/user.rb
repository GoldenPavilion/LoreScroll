class User < ApplicationRecord
    has_many :stories
    has_many :worlds, through: :stories
end
