class Transaction < ActiveRecord::Base
	validates_presence_of :debit, :credit, :amount
	has_many :commentaries
	belongs_to :debit_account, :class_name => "Account", :foreign_key => "debit"
	belongs_to :credit_account, :class_name => "Account", :foreign_key => "credit"

  scope :find_debit, ->(account_id) { where(:debit => account_id)}
  scope :find_credit, ->(account_id) { where(:credit => account_id)}

	def self.to_csv(options = {})
		column_names= ["id",	"debit",	"credit",	"amount",	"created_at",	"updated_at",	"commentary count"]
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
