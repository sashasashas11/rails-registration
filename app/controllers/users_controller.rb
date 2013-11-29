class UsersController < ApplicationController

	before_filter :is_authenticated, :only => [:profile]

	def new
	end

	def create
		session_id = User.generate_session_id
		user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: User.encrypt_password(params[:password]), session_id: session_id)
		unless user.save
			flash[:errors] = user.errors.full_messages
			render action: 'new' and return
		end

		if user
			#session.clear
			#session = {}
			#reset_session
			#session.delete(:session_id)
			session[:session_id]=session_id
			redirect_to '/users/profile'
		end

	end

	def sign_in
	end


	def profile
	end

end
