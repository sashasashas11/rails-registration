class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :index
      t.string :telephone
      t.string :city

      t.timestamps
    end
  end
end
