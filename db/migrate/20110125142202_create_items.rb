class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.integer :list_id
      t.string :name
      t.decimal :quantity
      t.boolean :checked

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
