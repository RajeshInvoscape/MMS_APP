class ShotsController < ApplicationController
	def create
		@sequence = Sequence.find(params[:shot][:sequence_id])
		@shot = Shot.new(params[:shot])
		@sequence.shots <<  @shot
		if @sequence.save
			flash[:success] = "Successfully created shots!"
			redirect_to sequence_url(@sequence)
		else
		   @shots = Shot.where(:sequence_id => @sequence.id)
		   render "sequences/show"
		end
	end
end
