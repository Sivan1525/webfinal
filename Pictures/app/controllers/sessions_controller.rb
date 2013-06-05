class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    @tips = ""
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      @tips = ""
      redirect_to home_url
      # notice: 'Signed in successfully.'
    else
      @tips = "Information not correct!"
      render 'new'
      # notice: 'Information not correct!'
    end
  end

  def destroy
    reset_session
    redirect_to welcome_url
  end
end