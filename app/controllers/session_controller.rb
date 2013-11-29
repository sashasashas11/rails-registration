class SessionController < ApplicationController

	#before_filter :is_authenticated

  def new
  end


  def create
		user = User.find_by_email_and_password params[:email], User.encrypt_password(params[:password])

		redirect_to '/users/profile' if user
		#render :inline => user.email if user
  end
end
