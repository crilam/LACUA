ActiveAdmin.register ClothsInventory do
  index do
    column :inventory_id
    column :cloth_id
    column :amount
    default_actions
  end

end
