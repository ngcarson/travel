class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
  
  skip_before_filter :verify_authenticity_token

  def google_oauth2
     
  @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication and return
    else
    	redirect_to '/' 
  end
end