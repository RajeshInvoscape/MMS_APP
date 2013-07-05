class UsersController < ApplicationController
	
	def new
		@user = User.new
	end
     
	def index
		@user = User.all
	end

	def create
		@user = User.new(params[:artist])
		if @user.save
			flash[:success] = "Successfully created artist!"
			redirect_to projects_url
		else
			render projects_url
		end
	end
end
