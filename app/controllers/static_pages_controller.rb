class StaticPagesController < ApplicationController
  skip_before_action :check_logged_in
  
  def home
    if logged_in?
      @user = User.find(session[:user_id])
    end
  end
end
