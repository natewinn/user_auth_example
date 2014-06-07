# require 'bcrypt'

class User < ActiveRecord::Base
	has_many :items
	
	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email

	belongs_to :role

	def admin?
		role.name == "admin"

	end	

end
