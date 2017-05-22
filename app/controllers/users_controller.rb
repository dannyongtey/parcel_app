class UsersController < ApplicationController
before_action :correct_user?
  def edit
    
    @user = current_user
  end
  
  def update
    @user = current_user
    phone_num = params[:user][:phone].delete("^0-9")
    @user.update_attributes(phone: phone_num)
    flash.now[:success] = "Phone number updated successfully"
    render 'edit'
  end
  private
  
  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end

  
end
