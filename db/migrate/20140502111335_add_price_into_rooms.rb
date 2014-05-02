class AddPriceIntoRooms < ActiveRecord::Migration
  def change

  	add_column :rooms, :price_in_pence, :integer

  end
end
