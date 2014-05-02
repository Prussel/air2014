Rails.application.routes.draw do
  
  # we want to add in a specific
  get "about" => "about#show"

  # we want to create a specific link to the right page for the return leg from scoial login
  # the :provider means 'anything' e.g. it could be facebook, twitter whatever
  get "auth/:provider/callback" => "social_logins#create"


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
