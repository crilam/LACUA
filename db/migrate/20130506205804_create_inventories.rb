class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :location_id
      t.string :state
      t.timestamps
    end
  end
end
