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
      flash[:notice] = "Welcome to Seedly!  <p>Philip will be sending you an email shortly to help get you started.</p>"
      redirect_to '/dashboard'
    else
      flash[:error] = @user.errors.full_messages.first
      redirect_to show_zip_path(:postal_code => @user.postal_code)
    end
  end
end
