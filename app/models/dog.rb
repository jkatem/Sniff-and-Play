class Dog < ApplicationRecord
  belongs_to :user
  has_many :photos

  scope :sort_name, -> { order(:name) }
end
