class Photo < ActiveRecord::Base
  attr_accessible :comment, :image, :user_id, :tag
  validates :image, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
