class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  include SessionsHelper
  before_action :check_logged_in
  def home
    
  end
  
  
  private
    def check_logged_in
      unless logged_in?
        flash[:danger] = "Log in is required."
        redirect_to root_url
      end
    end
    
    def check_admin
      
      redirect_to root_path unless current_user.admin?
    end

end
