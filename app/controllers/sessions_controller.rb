class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in(@user)
      flash[:success] = "You were successfully logged in"
      redirect_to @user
    else
      flash[:warning] = "You have not yet registered"
      render 'new'
    end
  end

  def destroy
    flash[:success] = "You were logged out!"
    log_out
    redirect_to root_url
  end
end
