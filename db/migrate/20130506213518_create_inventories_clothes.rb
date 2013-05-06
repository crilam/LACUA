class CreateInventoriesClothes < ActiveRecord::Migration
  def change
	create_table :inventories_clothes , :id => false do |t|
   		t.column :inventory_id, :integer
    	t.column :cloth_id, :integer
    	t.column :amount, :integer
  	end
  end
end
