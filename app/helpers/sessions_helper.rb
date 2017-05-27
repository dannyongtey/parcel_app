module SessionsHelper
  
  def current_user #returns current user or nil if there's none
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user?(user)
    current_user == user
  end
  
  def logged_in? #returns true false of login state
    !current_user.nil?
  end
  
  def admin?
    current_user.admin?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
