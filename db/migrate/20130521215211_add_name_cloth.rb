class AddNameCloth < ActiveRecord::Migration
  def change
    add_column :cloths ,:name,:string
  end
end
