class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :vendor
      t.string :customer
      t.float :amount

      t.timestamps
    end
  end
end
