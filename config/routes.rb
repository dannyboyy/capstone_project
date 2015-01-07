Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :comments
  
  resources :companies do
    collection do
      get :autocomplete
    end
  end

  root 'companies#index'


end
