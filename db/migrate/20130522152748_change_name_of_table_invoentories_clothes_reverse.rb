class ChangeNameOfTableInvoentoriesClothesReverse < ActiveRecord::Migration
  def change
  	rename_table :inventories_cloths, :cloths_inventories
  end
end
