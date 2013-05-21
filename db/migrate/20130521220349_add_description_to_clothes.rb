class AddDescriptionToClothes < ActiveRecord::Migration
  def change
    add_column :cloths, :description,:string
  end
end
