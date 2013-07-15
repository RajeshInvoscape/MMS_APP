class SessionsController < ApplicationController
	before_filter :signed_in_user, :only =>[:new]
	def new
		user = User.new
	end

	def create
	user = User.find_by_email(params[:sessions][:email])

	if user && user.authenticate(params[:sessions][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      if user.admin?
        redirect_to projects_url
      else
     	redirect_to user_url(user)
      end
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
