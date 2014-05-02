class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	# I want there to be two associations with an order, it belong to a room and a user
    	# we could store more with each order e.g.name etc
    	t.integer :room_id
    	t.integer :user_id
    	
    	# we also need to store the stripe token which is a reference on stripe.com to which credit card
    	t.string :stripe_token

      t.timestamps
    end
  end
end
