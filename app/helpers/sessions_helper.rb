module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
    self.current_user = user
  end

  def log_out
    current_user = nil
    session.delete(:user_id)
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if (id = session[:user_id])
      @current_user ||= User.find(id)
    end
  end

  def current_user=(user)
    @current_user = user
  end
end
