class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :author_name, presence: true
    validates :email, presence: true, uniqueness: true

    has_secure_password

    has_many :stories
    has_many :worlds

    def self.google_create(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.email = auth[:info][:email]
            u.author_name = auth[:info][:name]   
        end
    end

end
