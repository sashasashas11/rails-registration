class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated
	  1/0 unless current_user
  end


	def current_user
		@current_user ||= User.find session[:id]
	end
end
