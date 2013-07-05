class ProjectsController < ApplicationController
  before_filter :find_project_from_params , :only => [:show]
  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:success] = "Successfully created the project"
  		redirect_to '/projects'
  	else
      @projects = Project.all
  		render 'index'
  	end
  end
  def index
  	@projects = Project.all
    @project = Project.new
    @user = User.new
  end
  def show 
    @sequence = Sequence.new
    @sequences = Sequence.all
  end

  private

  def find_project_from_params
     @project = Project.find(params[:id])
  end
end
