class RemoveFieldAmountFromInventories < ActiveRecord::Migration
  def up
    remove_column :inventories, :amount
  end

  def down
    add_column :inventories, :amount, :integer
  end
end
