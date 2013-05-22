ActiveAdmin.register Inventory do
  index do
    column :location_id
    column :amount
    default_actions
  end
end
