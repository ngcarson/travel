class Api::IdeasController < Api::ApiController

	def index
		Rails.logger.info "Current user: #{current_user.inspect}"
		render json: Idea.all
	end

	def show
		idea = current_user.ideas.find(params[:id])
		render json: idea
	end

	def create
		idea = current_user.ideas.new(idea_params)
		if idea.save
			render json: {
				status: 200, 
				message: "Successfully created Idea.",
				idea: idea
			}.to_json
		else
			render status: 422, json: {
				error: idea.errors
			}.to_json
		end
	end

	def update
		idea = current_user.ideas.find(params[:id])
		if idea.update(idea_params)
			render json: {
				status: 200,
				message: "Successfully updated.",
				idea: idea
			}.to_json
		else
	    render status: 422, json: {
	      message: "The Idea could not be updated.",
	      idea: idea
	    }.to_json
		end
	end

	def destroy
	  idea = current_user.idea.find(params[:id])
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