ActiveAdmin.register ClothsInventory do
  index do
    column :amount
    default_actions
  end
  
  form do |f|
    f.inputs "Cloth" do
      f.input :cloth_id, :as => :select,:collection => Hash[Cloth.all.map{|b| [b.name,b.id]}]
    end
    f.inputs "Inventory" do
      f.input :inventory_id, :as => 
      :select,:collection => Hash[Inventory.all.map{|b| [b.location.name+" - Ropa "+b.state,b.id]}]
    end
    f.inputs "Cantidad" do
      f.input :amount
    end

    
    f.actions
  end
end
