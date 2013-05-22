ActiveAdmin.register Inventory do
  index do
    column :sub_location
    column :location_id
    column :amount
    default_actions
  end
end
