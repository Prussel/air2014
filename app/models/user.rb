class User < ActiveRecord::Base
	
	# associations
	has_many :rooms
	has_many :orders

	# validations
	validates :email, presence: true, uniqueness: true, if: ->{provider.nil?}
	validates :email, presence: true, uniqueness: true, if: ->{provider.nil?}

	
	# plugins
	#bcrypt handles password salting
	has_secure_password


end
