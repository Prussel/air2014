Rails.application.routes.draw do
  

  # we want to add in the ability to create, updatem delete and view rooms
  resources :rooms

  resources :users

  # login and log out
  # this is called a singular resource because we only want to do this one
  # note: it is resource singular below

  resource :session

  # this is the homepage
  root "rooms#index"


end
