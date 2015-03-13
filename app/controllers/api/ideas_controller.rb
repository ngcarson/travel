class Api::IdeasController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		render json: Idea.all
	end

	def show
		idea = Idea.find(params[:id])
		render json: idea
	end

	def create
		idea = Idea.new(idea_params)
		if idea.save
			render json: {
				status: 200, 
				message: "Successfully created Idea.",
				idea: idea
			}.to_json
		else
			render json: {
				status: 500, 
				error: idea.errors
			}.to_json
		end
	end

	def destroy
	  idea = Idea.find(params[:id])
	  idea.destroy

	  respond_to do |format|
	    format.html { redirect_to(ideas_url) }
	    format.xml  { head :ok }
  	end
	end

	private
	def idea_params
		params.require(:idea).permit(:image, :Idea, :Destination, :Start, :End, :Tags)
	end
end