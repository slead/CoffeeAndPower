Rails.application.routes.draw do
  devise_for :users
  resources :cafes do
    resources :comments
    member do
      get "like", to: "cafes#upvote"
      get "dislike", to: "cafes#downvote"
    end
  end

  resources :locations
  
  root 'cafes#index'
end
