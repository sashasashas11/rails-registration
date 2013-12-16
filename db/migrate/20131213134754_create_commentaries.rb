class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|
      t.text :massage
      t.integer :user_id
      t.integer :transaction_id
      t.timestamps
    end
  end
end
