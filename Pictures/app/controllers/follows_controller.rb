class FollowsController < ApplicationController
	def create
		@follow = Follow.new
		@follow.follower_id = session[:user_id]
		@follow.followed_id = params[:id]
		if @follow.save
				redirect_to '/users/'+params[:id], notice: 'You have followed this user'
		end
	end

	def destroy
		@follow = Follow.where(:follower_id => session[:user_id], :followed_id => params[:id])
		@follow.destroy_all
		redirect_to '/users/'+params[:id], notice: 'You have unfollowed this user'
	end

	def show
		@follower = params[:id]
		@follows = Follow.where(:follower_id => @follower)
		@user = User.find_by_id(session[:user_id])
	end
	def present
		@followed = params[:id]
		@follows = Follow.where(:followed_id => @followed)
		@user = User.find_by_id(session[:user_id])
	end
end
