class User < ActiveRecord::Base


	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email

	def self.encrypt_password string
		Digest::SHA1.hexdigest string
	end

	def self.generate_session_id
			Digest::SHA1.hexdigest rand(1000000000000).to_s
	end

end

