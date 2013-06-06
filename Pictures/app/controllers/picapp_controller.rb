class PicappController < ApplicationController
	def welcome
	end
	def home
		@user = User.find_by_id(session[:user_id])
		@pictures = @user.pictures
	end
end