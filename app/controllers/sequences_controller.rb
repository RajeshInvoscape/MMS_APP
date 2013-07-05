class SequencesController < ApplicationController
	def create
		@project = Project.find(params[:sequence][:project_id])
		@sequence = Sequence.new(params[:sequence])
		@project.sequences << @sequence
		if @project.save
			flash[:success] = "Successfully created sequence!"
			redirect_to project_url(@project)
		else
		   @sequences = Sequence.all
		   render '/projects/show'
		end
	end
	def show
	   @sequence = Sequence.find(params[:id])
	   @shot = Shot.new
	   @shots = Shot.all
	end
end
