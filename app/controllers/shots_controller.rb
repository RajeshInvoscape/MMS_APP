class ShotsController < ApplicationController
	before_filter :find_shots_from_params, :only => [:search]
	def create
		@sequence = Sequence.find(params[:shot][:sequence_id])
		begin
		  @shot = Shot.create!(params[:shot])
		rescue 
			@shots = Shot.where(:sequence_id => @sequence.id)
			@shot = Shot.new(params[:shot])
			@shot.valid?
			render "sequences/show" and return
		end
		@shot.roto_users.push(push_roto_users(params[:roto_users])) if params[:roto_users]
		@shot.paint_users.push(push_paint_users(params[:paint_users])) if params[:paint_users]
		@shot.comp_users.push(User.find(params[:comp_users])) unless params[:comp_users].blank?

		if @shot.save
			flash[:success] = "Successfully created shots!"
			redirect_to sequence_url(@sequence)
		else
		   @shots = Shot.where(:sequence_id => @sequence.id)
		   render "sequences/show"
		end
	end

	def search
		@shot = Shot.new
        @shots = Shot.search(params[:search])
        render "sequences/show"
    end

	private

	def push_roto_users(roto_user_ids)
	    roto_users = []
        roto_user_ids.each do |id|   
          roto_users.push(User.find(id)) unless id.blank?
        end
        return roto_users
	end 

	def push_paint_users(paint_user_ids)
	    paint_users = []
        paint_user_ids.each do |id|   
          paint_users.push(User.find(id)) unless id.blank?
        end
        return paint_users
	end
    
    private

    def find_shots_from_params
        @sequence = Sequence.find(params[:sequence_id])
   end
end
