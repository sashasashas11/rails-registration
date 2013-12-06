class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	#validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email

  #attr_accessible :email, :password, :password_confirmation, :remember_me
  #attr_accessible :nickname, :provider, :url, :username

	has_one :address
	#accepts_nested_attributes_for :address

	def self.encrypt_password string
		Digest::SHA1.hexdigest string
	end
end
