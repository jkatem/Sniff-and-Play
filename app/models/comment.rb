class Comment < ApplicationRecord
  belongs_to :dog, optional: true 
  belongs_to :photo, optional: true 
  belongs_to :user
end
