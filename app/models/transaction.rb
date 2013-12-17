class Transaction < ActiveRecord::Base
	validates_presence_of :vendor, :customer, :amount
	has_many :commentaries

	def self.to_csv(options = {})
		column_names= ["id",	"vendor",	"customer",	"amount",	"created_at",	"updated_at",	"commentary count"]
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |transaction|
				row = transaction.attributes.values_at(*column_names)
				row[6] = Commentary.where(transaction_id: transaction.id).count
				csv << row
			end
		end

	end
end
