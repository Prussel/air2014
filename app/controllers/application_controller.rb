class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



# --------------------------------------------------------------------
  # THIS ALLOWS ME TO DO CONTROLLER THINGS AROUND THE ENTIRE WEBSITE
# ====================================================================


# I want there to be a shortcut for finding the current user across the whole site
# the name current_user doesn't mean anything, we decide what it means, we're creating a variable
def current_user
	if session[:user_id].present?
		User.find(session[:user_id])
	end
end	


# to use the variable above in the views as well as the controllers we need to make a header method

helper_method :current_user

# add a shortcut to redirect to the sign up page if logged out

def make_sure_logged_in

	if not current_user.present?
		flash[:error] = "You must be signed up to see this page"
		redirect_to new_user_path

	end	

end	


end
