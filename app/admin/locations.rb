ActiveAdmin.register Location do
  menu :parent => "Otro"
  index do
    column :codigo
    column :name
    default_actions
  end
end
