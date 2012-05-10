class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end
  
  def simple_signup
    @user = User.new
    @user.email = params[:email]
    @user.postal_code = params[:zip]
    @user.password = Time.now.to_i
    if @user.save
      # redirect to second page of process
      sign_in(@user)
      redirect_to '/dashboard'
    else
      redirect_to '/'
    end
  end
end
