class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :photos, through: :comments
    


    validates :email, presence: true, 
        uniqueness: { case_sensitive: false }, 
        length: { maximum: 105 }
         
    has_secure_password

end
