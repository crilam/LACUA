ActiveAdmin.register Cloth do
  menu :parent => "Otro"
  index do
    column  :name
    column  :description
    column  :distintion
    column  :height
    column  :width
    column  :depth
    column  :color
    column  :feston
    column  :tipo
    column  :categoria do |cloth|
      cloth.category.name
    end
    default_actions
  end
  
  show do
    panel "Cloth" do
      table_for cloth.cloths_inventories do
        column "Ubicacion" do |cloths_inventories|
          cloths_inventories.inventory.location.name
        end
        column "Cantidad" do |cloths_inventories|
          cloths_inventories.amount
        end
        column "Estado" do |cloths_inventories|
          cloths_inventories.inventory.state
        end


      end
    end
  end
  

end
