class UsersController < ApplicationController
	before_filter :is_authenticated, :only => [:profile]

	def new
	end

	def create
		user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: User.encrypt_password(params[:password]))

		redirect_to '/users/sign_in' and return if user.save

		flash[:errors] = user.errors.full_messages
		render action: 'new'
	end

	def login
		user = User.find_by_email_and_password params[:email], User.encrypt_password(params[:password])

		render action: 'sign_in' and return unless user

		session[:id] = user.id
		redirect_to '/users/profile'
	end

	def sign_in
	end

	def profile
	end

end
