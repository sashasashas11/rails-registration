class Transaction < ActiveRecord::Base
	validates_presence_of  :vendor, :customer, :amount
end
