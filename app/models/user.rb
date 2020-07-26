class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :photos, through: :comments

    validates :email, uniqueness: true
 
    has_secure_password

end
