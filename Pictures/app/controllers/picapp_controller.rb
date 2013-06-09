class PicappController < ApplicationController
	def welcome
	end
	def home
		@user = User.find_by_id(session[:user_id])
		@pictures = @user.caringpictures.order("created_at DESC")
	end
	
	def search
		@user = User.find_by_id(session[:user_id])
		@searchcontent = params[:searchcontent]
		puts "Got content " + @searchcontent + "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
		@photos = Photo.all(:conditions => "tag LIKE '%#{@searchcontent}%' OR comment LIKE '%#{@searchcontent}%'")
		@users = User.all(:conditions => "username LIKE '%#{@searchcontent}%'")
	end
	# def follow
	# 	@follow = Follow.new
	# 	@follow.follower_id = session[:user_id]
	# 	@follow.followed_id = params[:id]
	# 	if @follow.save
	# 			redirect_to '/users/'+params[:id], notice: 'You have followed this user'
	# 	end
	# end
	# def unfollow
	# 	@follow = Follow.where(:follower_id => session[:user_id], :followed_id => params[:id])
	# 	@follow.destroy_all
	# 	redirect_to '/users/'+params[:id], notice: 'You have unfollowed this user'
	# end
end