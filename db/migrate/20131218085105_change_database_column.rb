class ChangeDatabaseColumn < ActiveRecord::Migration
	def change
		change_table :transactions do |t|
			t.change :debit, :integer
			t.change :credit, :integer
		end
	end

end
