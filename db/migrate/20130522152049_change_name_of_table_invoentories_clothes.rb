class ChangeNameOfTableInvoentoriesClothes < ActiveRecord::Migration
  def change
  	rename_table :inventories_clothes, :inventories_cloths
  end
end
