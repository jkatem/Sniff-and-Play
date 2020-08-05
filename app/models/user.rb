class User < ApplicationRecord
    has_many :dogs, dependent: :destroy
    has_many :comments
    has_many :photos, through: :comments
    
    validates :name, presence: true
    
    validates :email, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { maximum: 105 }
         
    has_secure_password

    def self.create_by_google_omniauth(auth)
      self.find_or_create_by(name: auth[:info][:email]) do |u|
        u.email = auth[:info][:email]
        u.password = SecureRandom.hex
      end
    end
end
