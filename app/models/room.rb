class Room < ActiveRecord::Base

	# associations



	# validations

	validates :name, presence: true
	validates :address, presence: true
	# validating the number of guests between two different numbers
	validates :number_of_guests, presence: true, numericality: { greater_than: 0}

	# plugins

		# going to add in the geocoder gem. we can get the code to do this from the geocode website
		# this mean we will find you by your address
		geocoded_by :address 
		# we will do this after the top two items have been validated
		after_validation :geocode


	# anything else



end
