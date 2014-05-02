class User < ActiveRecord::Base
	
	# associations
	has_many :rooms
	has_many :orders

	# validations
	validates :email, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	
	# plugins
	#bcrypt handles password salting
	has_secure_password


end
