module Api
	class ApiController < ApplicationController
		skip_before_filter :verify_authenticity_token
		protect_from_forgery with: :null_session
		before_filter :check_auth

		def current_user
			@current_user
		end

	  def check_auth
	    authenticate_or_request_with_http_basic do |user,password|
	      resource = User.find_by_email(user)
	      if resource.valid_password?(password)
	      	@current_user = user
	        sign_in :user, resource
	      end
	    end
	  end
	end
end