class Photo < ApplicationRecord
  belongs_to :dog
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  
  has_one_attached :image_file

end
