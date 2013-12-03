class User < ActiveRecord::Base
	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email

	has_one :address
	#accepts_nested_attributes_for :address

	def self.encrypt_password string
		Digest::SHA1.hexdigest string
	end
end
