class CreateClothsInventories < ActiveRecord::Migration
  def change
    create_table :cloths_inventories do |t|
      t.integer :cloth_id
      t.integer :inventory_id
      t.integer :amount
      t.timestamps
    end
  end
end
