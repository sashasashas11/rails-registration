class UsersController < ApplicationController
	layout "user_layout"

	before_filter :is_authenticated, :only => [:profile]

	def new
	end

	def create
		user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: User.encrypt_password(params[:password]))
		unless user.save
			flash[:errors] = user.errors.full_messages
			render action: 'new' and return
		end

			redirect_to '/users/sign_in'   if user
	end

	def login
		user = User.find_by_email_and_password params[:email], User.encrypt_password(params[:password])

		unless user
			render action: 'sign_in' and return
		end

		if user
			session[:id] = user.id
			redirect_to '/users/profile'
		end
	end

	def sign_in
	end


	def profile
	end

end
