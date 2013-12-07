class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?


  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) do |u|
		  u.permit(:first_name, :last_name,  :gender, :email, :password, :password_confirmation,
		           address_attributes: [:telephone, :city, :index]
		  )
	  end

  end

  #protected
  #def devise_parameter_sanitizer
	 #if resource_class == User
		#  User::ParameterSanitizer.new(User, :user, params)
	 #else
		#  super
	 #end
  #end
  #protected
  #
  #def configure_permitted_parameters
	 # devise_parameter_sanitizer.for(:sign_up) << :username
  #end



	#def is_authenticated
	# render text: "User is not registration" and return   unless current_user
	#end
	#
	#
	#def current_user
	#	@current_user ||= User.find session[:id]
	#end
end
