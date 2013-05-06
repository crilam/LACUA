class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :sub_location
      t.int :location_id
      t.int :amount

      t.timestamps
    end
  end
end
