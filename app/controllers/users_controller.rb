class UsersController < ApplicationController
  
  def new
  end

  def create

  	@user = User.new(user_params)

  	if @user.save
  		session[:user_id] = @user_id
  		flash[:success] = "User Created."
  		redirect_to '/login'
  	else
  		flash[:danger] = "Sorry, Unable to Create User."
  		redirect_to "/signup"
  	end

  end

  private
  def user_params
  	params.require(:user).permit(:email, :password)
  end

end
