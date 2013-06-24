ActiveAdmin.register Location do
  menu :parent => "Otro", :if => proc{ can? :manage, :all}
  index do
    column :codigo
    column :name
    default_actions
  end
end
