class Room < ActiveRecord::Base

	# associations

	belongs_to :user
	has_many :orders

	# validations

	validates :name, presence: true
	validates :address, presence: true
	# validating the number of guests between two different numbers
	validates :number_of_guests, presence: true, numericality: { greater_than: 0}

	validates :price_in_pence, presence: true, numericality: {greater_than_or_equal_to: 50}

	# plugins

		# going to add in the geocoder gem. we can get the code to do this from the geocode website
		# this mean we will find you by your address
		geocoded_by :address 
		# we will do this after the top two items have been validated
		after_validation :geocode

		# adding in paperclip
		# 960x400# will mean crop the image to 960x40
		# could use 500x which would just do the width
		# x500 just the height
		# need the hash, without it will do either or
		has_attached_file :image, styles: {large: "960x400#", medium: "320x200#", thumbnail: "60x60#" }
			validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	# anything else



end
