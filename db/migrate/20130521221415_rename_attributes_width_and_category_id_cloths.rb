class RenameAttributesWidthAndCategoryIdCloths < ActiveRecord::Migration
  def change
    rename_column :cloths, :widht,:width
    rename_column :cloths, :categoty_id, :category_id
  end
end
