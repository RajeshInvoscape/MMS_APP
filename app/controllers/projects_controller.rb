class ProjectsController < ApplicationController
  def new
    @project = Project.new  	
  end
  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:success] = "Successfully created the project"
  		redirect_to '/projects'
  	else
  		render 'new'
  	end
  end
  def index
  	@projects = Project.all
  end
end
