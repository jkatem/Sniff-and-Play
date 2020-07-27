class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :photos, through: :comments
  
    validates :email, presence: true
 
    has_secure_password

    def self.from_omniauth(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end

end
