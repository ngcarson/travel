class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :comment, length: { maximum: 10, too_long: "%{count} characters is the maximum allowed" }, :allow_blank => false
end
