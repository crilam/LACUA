ActiveAdmin.register Category do
  menu :parent => "Otro"
  index do
    column :name
    default_actions
  end
end
