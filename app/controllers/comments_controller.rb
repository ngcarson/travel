class CommentsController < ApplicationController
	def create
		# Post a comment associated to the current Idea ID.
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.create(params[:comment].permit(:comment))
		# Saving User ID as the Current User.
		@comment.user_id = current_user.id if current_user
		# Must include "comment.save" to successfully indicate User's email.
		@comment.save

		if @comment.save
			redirect_to idea_path(@idea)
		else
			# Redirects user back to edit comments form if post fails.
      render 'edit'
		end
	end

	def edit
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])

		if @comment.update(params[:comment].permit(:comment))
			redirect_to idea_path(@idea)
		else
			render 'edit'
		end
	end

	def destroy
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.find(params[:id])
		@comment.destroy
		redirect_to idea_path(@idea)
	end
end