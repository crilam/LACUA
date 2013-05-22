class RemoveSubLocationFromInventory < ActiveRecord::Migration
  def change
  	remove_column :inventories, :sub_location
  	add_column :locations, :floor,:string
  end
end
