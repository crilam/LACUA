class CreateClothsInventories < ActiveRecord::Migration
  def change
    create_table :cloths_inventories do |t|

      t.timestamps
    end
  end
end
