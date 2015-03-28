class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected
  
  # Permits the additional extra parameters in Devise.
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :username
  	devise_parameter_sanitizer.for(:account_update) << :username

  	devise_parameter_sanitizer.for(:sign_up) << :first_name
  	devise_parameter_sanitizer.for(:account_update) << :first_name

  	devise_parameter_sanitizer.for(:sign_up) << :last_name
  	devise_parameter_sanitizer.for(:account_update) << :last_name
  end
end