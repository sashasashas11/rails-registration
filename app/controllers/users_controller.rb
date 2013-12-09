class UsersController < Devise::RegistrationsController

	def new
		@user = User.new
		@user.build_address
	end

end
