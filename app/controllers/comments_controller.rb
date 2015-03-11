class CommentsController < ApplicationController
	def create
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.create(params[:comment].permit(:comment))
		if @comment.save
			redirect_to idea_path(@idea)
		else
			render 'new'
		end
	end
end
