class AddFieldStateToInventories < ActiveRecord::Migration
  def change
    add_column :inventories, :state, :string
  end
end
