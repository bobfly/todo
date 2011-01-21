class CreateLists < ActiveRecord::Migration
  def self.up
    create_table :lists do |t|
      t.string :name
      t.date :list_date
      t.string :description
      t.integer :user_id
      t.integer :assigned_to
      t.timestamps
    end
  end

  def self.down
    drop_table :lists
  end
end
