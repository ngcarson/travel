class Comment < ActiveRecord::Base
  # Associates the posted comment to the Idea & User logged in.
  belongs_to :idea
  belongs_to :user
  
  # Form validator for comment field.
  validates :comment, length: { maximum: 10, too_long: "%{count} characters is the maximum allowed" }, :allow_blank => false
end