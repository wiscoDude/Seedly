class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end
  
  def create_without_password
    
  end
end
