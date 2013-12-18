class RenameDatabaseColumn < ActiveRecord::Migration
	def change
		change_table :transactions do |t|
			t.rename :vendor, :debit
			t.rename :customer, :credit
		end
	end
end
