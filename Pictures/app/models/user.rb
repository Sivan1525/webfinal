class User < ActiveRecord::Base
  attr_accessible :email, :password, :username, :password_confirmation, :image

  has_secure_password
  has_many :photo

  mount_uploader :image, ImageUploader

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :image, presence: true

  def pictures
  		return @pictures = Photo.where(:user_id => self.id)
  end
  def followers
      return @followers = Follow.where(:followed_id => self.id)
  end
  def hasFollowedHim(hisid)
      @result = Follow.where(:followed_id => hisid, :follower_id =>self.id)
      if @result.count == 0
        return false
      else
        return true
      end
  end
end
