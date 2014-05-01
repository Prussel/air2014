class UsersController < ApplicationController

def new
	# sign up form

	@user = User.new

end

def create
	# actually sign up to the site

	@user = User.new(user_params)

	if 
		@user.save

		# we want to give the user a cookie to let them know who they are / so they don't have to keep logging in
		# we choose the phrase :user_id, that is what we can refer to elsewhere
		session[:user_id] = @user.id

		# -------

		flash[:success] = "Thanks for signing up"

		redirect_to root_path

	else
	
		render "new"

	end

end	

def user_params
	# make sure the form data is white listed
	# we have the password and confirm password fields which the rails secure password functionality will sort out for us
	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)

end	












end
