class SocialLoginsController < ApplicationController
# we want to hangle logins or sign up with social networks

def create

# this code came from the omni auth documentation however we defined the name of the variable @data
# this is getting the data from onmi auth
@data = request.env["omniauth.auth"]

	@provider = @data[:provider]
	@provider_id = @data[:uid]

	#we now check if there are any users on the site that have this provider and provider ID
	@users = User.where(provider: @provider, provider_id: @provider_id)

	# if there are any users with the above credentials then they are already signed up and log them in
	if @users.any?
		# signed in as the first user we have in the list
		@user = @users.first
		# here we are basically giving the user a ticket with the users ID like the normal login
		session[:user_id] = @user.id
		flash[:success] = "You're now logged in"
		redirect_to root_path
	else	
		# make a user with the details from omni auth
		@user = User.new

		# we then need to create the user with the details that we get back from omniauth
		@user.provider = @provider
		@user.provider_id = @provider_id

		# lets now get the users info from omni auth
		# these fields at the end ["name"] etc come from th eomni auth website aka what they call fields
		@user.name = @data["info"]["name"]
		@user.username = @data["info"]["nickname"]
		@user.email = @data["info"]["email"]

		#fill in the users password for us

		@user.password = "123456"
		@user.password_confirmation = "123456"

		# we also need to save their key and their secret
		@user.key = @data["credentials"]["token"]
		@user.secret = @data["credentials"]["secret"]

		# adding a ! after dave will screem out errors`1
		@user.save!

		session[:user_id] = @user.id
		flash[:success] = "You are now signed up to Onboard"
		redirect_to root_path
	end


end	


end
