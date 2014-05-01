class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true

	#bcrypt handles password salting
	has_secure_password


end
