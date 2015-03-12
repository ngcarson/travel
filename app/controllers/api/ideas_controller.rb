class Api::IdeasController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		render json: Idea.all
	end

	def show
		list = Idea.find(params[:id])
		render json: list
	end

	def create
		list = Idea.new(list_params)
		if list.save
			head 200
		else
			head 500 
		end
	end

	private
	def list_params
		params.require("idea").permit("idea")
	end
end