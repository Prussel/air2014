class SessionsController < ApplicationController

	def new
		# sign up form
		# no need for any varibles because we aren't adding anything to the database

	end	

	def create
		# get the username and password from the form
		# see if there's a user with that username
		# if there is AND the password matches, then log in
		# if not, don't login and show and error

		# the below is saying that within the session form there is a username, get it
		@username = params[:session][:username]
		@password = params[:session][:password]

		# now we see if there is a user with the username.
		@user = User.find_by_username(@username)

		# if there is a user with password that matches login or if not then don't

		if @user.present? and @user.authenticate(@password)
			# to log in we need to give them a sesion
			session[:user_id] = @user.id
			flash[:success] = "Welcome back, #{@user.name}"
			redirect_to root_path
		else

			flash[:error] = "Computer says no"
			render "new"
			
		end

	end	


	def destroy
		# log out / remove the ticket from the user
		# reset session is built into rails
		reset_session

		flash[:success] = "You've logged out"
		redirect_to root_path


	end	




end
