Rails.application.routes.draw do
  resources :cafes
  root 'cafes#index'
end
