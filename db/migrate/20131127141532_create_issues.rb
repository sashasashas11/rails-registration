class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.integer :no_followers

      t.timestamps
    end
  end
end
