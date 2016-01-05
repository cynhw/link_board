class SessionsController < ApplicationController



  def new
  end

  def create
  	@user = User.authenticate user_params[:email], user_params[:password]

	  	if @user
	  		session[:user_id] = @user.id
	  		flash[:success] = "User Logged In"
	  		redirect_to '/'
	  	else
	  		flash[:error] = "Credentials Invalid"
	  		redirect_to '/login'
	  	end
	end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged Out."
    redirect_to '/'
  end 

  private

  def user_params
  	params.require(:user).permit(:email, :password)
  end

end
