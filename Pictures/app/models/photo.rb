class Photo < ActiveRecord::Base
  attr_accessible :detail, :image, :user_id
  validates :image, presence: true
  belongs_to :user
  has_many :comment
  mount_uploader :image, ImageUploader

  def gettag
  	@result = Hastag.find_by_photo_id(self.id)
    puts "-----------------------------------" + self.id.to_s + "---------------------"
  	if (@result!=nil)
  		return Tag.find_by_id(@result.tag_id).content
  	else
  		return ""
  	end
  end
end
