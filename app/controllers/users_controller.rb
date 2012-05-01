class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end
  
  def create_without_password
    @user = User.new
    @user.email = params[:email]
    @user.postal_code = params[:postal_code]
    @user.password = Time.now.to_i
    if @user.save
      # redirect to second page of process
    else
      
    end
  end
end
