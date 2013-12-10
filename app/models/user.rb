class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

	validates_presence_of :first_name, :last_name, :email, :password
	validates_uniqueness_of :email

	has_one :address, :inverse_of => :user, :autosave => true
	accepts_nested_attributes_for :address, :allow_destroy => true

end






