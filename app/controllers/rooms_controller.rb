class RoomsController < ApplicationController

def index
	# this is the homepage
	@rooms = Room.all


end

def show

	# create the show page for the individual room

	@room = Room.find(params[:id])

end	



def new

	# add a new room form

	@room = Room.new

end	

def create

	# this will ensure what is added on the new page is created in the db

	@room = Room.new(room_params)

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
	@room = Room.find(params[:id])

end

def update

	@room = Room.find(params[:id])

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
	@room = Room.find(params[:id])

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
