class ProjectsController < ApplicationController
  before_filter :find_project_from_params , :only => [:show]
  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:success] = "Successfully created the project"
  		redirect_to '/projects'
  	else
      @projects = Project.all
      @user =User.new
  		render 'index'
  	end
  end
  def index
  	@projects = Project.paginate(page: params[:page], per_page: 5)
    @project = Project.new
  end
  def show 
    @sequence = Sequence.new
    @sequences = Sequence.where(:project_id => @project.id)
  end
  private

  def find_project_from_params
     @project = Project.find(params[:id])
  end
end
