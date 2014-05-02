class AddOmniauthFieldsToUser < ActiveRecord::Migration
  def change

  	# I want to add a way to track users who come in from social networks
  	add_column :users, :provider, :string
  	add_column :users, :provider_id, :string
  	add_column :users, :key, :string
  	add_column :users, :secret, :string
  
  end
end
