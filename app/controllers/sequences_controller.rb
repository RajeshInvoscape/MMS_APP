class SequencesController < ApplicationController
    before_filter :find_sequence_from_params, :only => [:show]
	def create
		@project = Project.find(params[:sequence][:project_id])
		@sequence = Sequence.new(params[:sequence])
		@project.sequences << @sequence
		if @project.save
			flash[:success] = "Successfully created sequence!"
			redirect_to project_url(@project)
		else
		   @sequences = Sequence.where(:project_id => @project.id)
		   render '/projects/show'
		end
	end

	def show
	   @shot = Shot.new
	   @shots = Shot.where(:sequence_id => @sequence.id)
	end
	
    private
    def  find_sequence_from_params
    	@sequence = Sequence.find(params[:id])
    end
end
