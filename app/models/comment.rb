class Comment < ApplicationRecord
  belongs_to :dog, optional: true 
  belongs_to :photo, optional: true 
  belongs_to :user

  validate :comment_too_long, on: :create
end

def comment_too_long
  if self.content.length > 50
    errors.add(:content, "- too long. Max length is 50.")
  end
end
