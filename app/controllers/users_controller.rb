class UsersController < ApplicationController
  include UserSessionsHelper
  before_action :set_user, only: :show

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user_events = @user.events unless @user.nil?
    @user_attended = @user.attended_events
    @upcoming_events = @user_attended.upcoming_events
    @past_events = @user_attended.past_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :username)
  end
end
