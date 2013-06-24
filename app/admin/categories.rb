ActiveAdmin.register Category do
  menu :parent => "Otro", :if => proc{ can? :manage, :all}
  index do
    column :name
    default_actions
  end
end
