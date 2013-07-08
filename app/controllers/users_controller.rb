class UsersController < ApplicationController 
	  before_filter :admin_user, only: [:index, :edit, :update, :destroy, :create]
      before_filter :correct_user,   only: [:edit, :update]
	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Successfully created artist!"
			redirect_to projects_url
		else
			@projects = Project.all
			@project = Project.new
			render '/projects/index'
		end
	end
    def show
    end

	private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(users_path) unless current_user?(@user)
    end
     def admin_user
      redirect_to(projects_path) unless current_user.admin?
    end
end
