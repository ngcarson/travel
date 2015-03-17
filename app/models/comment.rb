class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  #validates :text, :presence => true, :length => { :minimum => 10 }
end
