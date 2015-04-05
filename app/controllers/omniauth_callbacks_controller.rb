class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
def google_oauth2
     
  @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

		@user.persisted?
	   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	   flash[:notice] = "Successfully authenticated from Google account. (For first time users, sign-in google again)"
	   sign_in_and_redirect @user, :event => :authentication
  end
end