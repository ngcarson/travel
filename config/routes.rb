Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "omniauth_callbacks" }
  
  resources :ideas do 
    resources :comments
  end
  
  # Show's the Homepage of the Web App.
  root "pages#home"

  # Additional HTML in the view for "Show Ideas".
  get "ideas" => "pages#ideas"
end