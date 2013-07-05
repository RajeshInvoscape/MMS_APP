class ShotsController < ApplicationController
	def create
		@sequence = Sequence.find(params[:shot][:sequence_id])
		@shot = Shot.new(params[:shot])
		@sequence.shots <<  @shot
		if @sequence.save
			flash[:success] = "Successfully created shots!"
			redirect_to sequence_url(@sequence)
		else
		   @shots = Shot.all
		   render "sequences/show"
		end
	end
	def index

	end
end
