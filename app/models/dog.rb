class Dog < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :name, presence: :true 


  scope :sort_name, -> { order(:name) }
end
