class User < ApplicationRecord
    has_many :dogs
    has_many :comments
    has_many :photos, through: :comments
    # has_many_attached :dog_photos


    validates :email, uniqueness: true
 
    has_secure_password

end
