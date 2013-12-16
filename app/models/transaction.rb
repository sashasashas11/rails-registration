class Transaction < ActiveRecord::Base
	validates_presence_of  :vendor, :customer, :amount
	has_many :commentaries

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |transaction|
				csv << transaction.attributes.values_at(*column_names)
			end
		end

	end
end
