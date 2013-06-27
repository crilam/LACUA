ActiveAdmin.register Batch do
  
  scope :broken
  scope :all
  
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
  
  form do |f|
    f.inputs "Detalles" do
      f.input :cloth
      f.input :description
      f.input :reference
      f.input :state
    end
    f.actions
  end
  
  show :title => :description do |batch|
        attributes_table do
          row :cloth_id
          row :quality
        end
        active_admin_comments
    end
end