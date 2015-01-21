Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :comments
  
  resources :companies do
    collection do
      get :autocomplete
    end
    
    member do 
      put "like", to: "companies#upvote"
      put "dislike", to: "companies#downvote"
    end
  end

  root 'companies#index'
  
end
