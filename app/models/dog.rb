class Dog < ApplicationRecord
  belongs_to :user
  has_many :photos

  has_one_attached :dog_avatar

end
