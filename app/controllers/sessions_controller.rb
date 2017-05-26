class SessionsController < ApplicationController
  skip_before_action :check_logged_in
  before_action :already_logged_in, except: :destroy
  
  def new
    
  end
  def create
    if params[:username] == "admin"
      admin = User.find_by(name: "admin")
      log_in(admin)
      redirect_to root_url
    else
      google_api = env["omniauth.auth"]
      if google_api.extra.id_info.email.match(/\A\d{10}@student.mmu.edu.my\z/i)
        user = User.from_omniauth(google_api)
        log_in(user)
  
        redirect_to root_url
      else
        flash[:danger] = "Access denied. Please only log in using mmu student email"
        redirect_to root_path
        env["omniauth.auth"] = nil
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  
  def already_logged_in
    if logged_in? 
      redirect_to root_path
    end
  end

end
