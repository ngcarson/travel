class CommentsController < ApplicationController
	before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # Guests can only see index & show.
  before_filter :authenticate_user!, except: [:index, :show]
  
	def create
		# Post a comment associated to the current Idea ID.
		@idea = Idea.find(params[:idea_id])
		@comment = @idea.comments.create(params[:comment].permit(:comment))
		# Saving User ID as the current user.
		@comment.user_id = current_user.id if current_user
		# Must include "comment.save" to successfully indicate User's email.
		@comment.save

		#if @comment.save
		# jQuery Ajax for posting comments called from "create.js.erb".
		respond_to do |format|
			format.html { redirect_to idea_path(@idea) }
			format.js
		#else
			# Redirects user back to edit comments form if post fails.
      #render 'edit'
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
		
		# jQuery Ajax for posting comments called from "destroy.js.erb".
		respond_to do |format|
			format.html { redirect_to idea_path(@idea) }
			format.js
		end
	end
end