Rails.application.routes.draw do
  devise_for :users
  resources :cafes
  root 'cafes#index'
end
