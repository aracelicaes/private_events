class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    unless user.nil?
      session[:name]= user.name
      session[:username] = user.username
      redirect_to(:users, notice:"Sign in as #{session[:name]}")
    else
      flash.now.alert = "Login failed."
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end



end
