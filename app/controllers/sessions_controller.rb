class SessionsController < ApplicationController
  skip_before_action :check_logged_in
  
  def create
    google_api = env["omniauth.auth"]
    if google_api.extra.id_info.email.match(/\A\d{10}@student.mmu.edu.my\z/i)
      user = User.from_omniauth(google_api)
      session[:user_id] = user.id

      redirect_to root_url
    else
      flash[:danger] = "Access denied. Please only log in using mmu student email"
      redirect_to root_path
      env["omniauth.auth"] = nil
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end


end
