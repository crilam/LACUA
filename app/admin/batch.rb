ActiveAdmin.register Batch do
  
  menu :parent => "Otro", :if => proc{ can? :manage, :all}
  index do
    column :cloth
    column :quality do |q|
      div :class => "quality" do
        number_to_percentage q.quality*100, :precision => 1
      end
    end
    column :description
    
    default_actions
  end
end