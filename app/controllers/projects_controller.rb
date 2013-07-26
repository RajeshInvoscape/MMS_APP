class ProjectsController < ApplicationController
  before_filter :find_project_from_params , :only => [:show, :edit, :update]
  def create
  	@project = Project.new(params[:project])
  	if @project.save
  		flash[:success] = "Successfully created the project"
  		redirect_to projects_path
  	else
      @projects = Project.paginate(page: params[:page], per_page: 5).order('projectname asc')
      @user =User.new
  		render 'index'
  	end
  end
  def index
  	@projects = Project.paginate(page: params[:page], per_page: 5).order('projectname asc')
    @project = Project.new
  end
  def show 
    @sequence = Sequence.new
    @sequences = Sequence.where(:project_id => @project.id)
  end
  
  def update
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.js 
      else
        @projects = Project.paginate(page: params[:page], per_page: 5).order('projectname asc')
        format.html { render action: "index" }
      end
    end
  end 
  
  private

  def find_project_from_params
     @project = Project.find(params[:id])
  end
end
