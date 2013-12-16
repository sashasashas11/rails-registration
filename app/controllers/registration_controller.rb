	class RegistrationController <ApplicationController
	before_filter :authenticate_user!, :only => [:profile]

	def profile
		@address = Address.find_by_user_id current_user
	end

	def error
		user = User.find_by_email params[:email]

		render text: 'true' and return  if user

		render text: 'false'
	end

end
