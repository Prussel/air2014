Rails.application.routes.draw do
  

  # we want to add in the ability to create, updatem delete and view rooms
  resources :rooms

  resources :users

  # this is the homepage
  root "rooms#index"


end
