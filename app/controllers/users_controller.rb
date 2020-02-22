class UsersController < ApplicationController
  before_action :user_exists, only: [:create]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to @user
    else

    end
  end

  def show
  end

  private
    def user_params  
      params.require(:user).permit(:name, :email)
    end

    def user_exists
      @user = User.find_by(email: user_params[:email])
      if @user
        flash[:warning] = "A user with this email already exists"
        redirect_to root_url
      end
    end
end
