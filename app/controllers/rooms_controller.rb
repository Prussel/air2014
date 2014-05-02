class RoomsController < ApplicationController

	# I want to do a check before certain activities happen
	before_action :make_sure_logged_in, only: [:new, :create, :edit, :update, :destroy]




def index
	# this is the homepage
	@rooms = Room.all

# this is to filter on a room type being a flat instead of a house
# we would need a type column in the DB
	# if params[:type] == "flat"
	# 	@rooms = @rooms.where(room_type: "flat")

	# end	

# this is how to filter that we want a double room not a single
	# if params["double_room"] = "true"
	# 	@rooms = @rooms.where ("double_room")

	# end	


# this is how we do an either or for a room type being EITHER a single or double 
	# if params[:double_room] = "true"
	# 	@rooms = @rooms where("room_type = ? or room_type = ?", "single", "double")

	# end

end

def show

	# create the show page for the individual room

	@room = Room.find(params[:id])

end	



def new

	# add a new room form
	# @room = Room.new

	# using current_user which was created earlier in sessions stuff to ensure that new room is associated with the right user
	@room = current_user.rooms.new

end	

def create

	# this will ensure what is added on the new page is created in the db

	@room = current_user.rooms.new(room_params)

		if @room.save

		# let the user know that it was successful
			flash[:success] = "Thanks for adding a room"

			# I want to go to the individual room page
			redirect_to room_path(@room)

		# this is what happens if the data doesn't pass validation and save to the database 
		else

			flash[:error] ="Woops - something went wrong"
			# lets show the add a story form again to see if they want to try again
			render "new"

		end


end

def edit
	# a form for editing the room
	@room = current_user.rooms.find(params[:id])

end

def update

	@room = current_user.rooms.find(params[:id])

	if @room.update(room_params)

		flash[:success] = "Thanks for updating the listing"

		redirect_to room_path(@room)

	else
		flash[:error] = "Woops - something has gone wrong"

		render "edit"
	end	

end

def destroy
	# actually delete the room on the DB
	@room = current_user.rooms.find(params[:id])

	@room.destroy

	flash[:success] = "Holy Moley! The room has been deleted!"

	redirect_to root_path

end	




def room_params
		
		# find the data from the form
		# making sure it is the room form and that it only has the fields I want
		params.require(:room).permit(:name, :address, :description, :number_of_guests, :image)

end

end	
