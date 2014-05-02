Rails.application.routes.draw do
  

  # we want to add in the ability to create, updatem delete and view rooms
  resources :rooms do

  	resources :orders

  end	

  # because orders are always on rooms we nest the resources

  resources :users

  # login and log out
  # this is called a singular resource because we only want to do this one
  # note: it is resource singular below

  resource :session

  # this is the homepage
  root "rooms#index"


end
