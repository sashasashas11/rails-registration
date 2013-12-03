class UsersController < ApplicationController
	before_filter :is_authenticated, :only => [:profile]

	def new
		@user = User.new
	end

	def create
		#@user = User.new(params[:user])
		@user = User.new(first_name: params[:user][:first_name],
		                 last_name: params[:user][:last_name],
		                 email: params[:user][:email],
		                 password: User.encrypt_password(params[:user][:password])
										)

		@address = Address.new(index: params[:user][:address][:index],
														telephone: params[:user][:address][:telephone],
		                       city: params[:user][:address][:city]
		)

		if @user.save
			@address.user = @user
			@address.save
			redirect_to '/users/sign_in' and return
		end

		flash[:errors] = @user.errors.full_messages
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
