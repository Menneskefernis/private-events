class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:warning] = "You need to log in"
      redirect_to root_path
    end
  end
end
