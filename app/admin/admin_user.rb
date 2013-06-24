ActiveAdmin.register AdminUser do
  menu :parent => "Otro", :if => proc{ can? :manage, :all}
  index do                            
    column :email                     
    column :current_sign_in_at        
    column :last_sign_in_at           
    column :sign_in_count
    column  :rol do |adminUser|
      if !adminUser.roles.first.nil?
        adminUser.roles.first.name
      end
    end             
    default_actions                   
  end                                 

  filter :email                       

  form do |f|                         
    f.inputs "Admin Details" do       
      f.input :email                  
      f.input :password               
      f.input :password_confirmation  
      f.input :role_ids, :as => :select, :collection => Role.all, :label_method => :format_name, :value_method => :id

    end                               
    f.actions                         
  end                                 
end                                   
