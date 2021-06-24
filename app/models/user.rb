class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :author_name, presence: true
    validates :email, presence: true, uniqueness: true

    has_secure_password

    has_many :stories
    has_many :worlds, through: :stories

end
