ActiveAdmin.register Inventory do
  index do
  	column :id
    column :location_id
    column :state
    default_actions
  end
end
