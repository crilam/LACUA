class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :sub_location
      t.integer :location_id
      t.integer :amount

      t.timestamps
    end
  end
end
