class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|

    	t.string :name
		t.string :address
		t.float :latitude
		t.float :longitude
		t.text :description
		t.integer :number_of_guests

      t.timestamps
    end
  end
end
