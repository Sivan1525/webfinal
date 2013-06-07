class Follow < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :follower_id, :followed_id
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
