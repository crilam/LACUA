ActiveAdmin.register Inventory , :as => "Ropa Limpia" do
  
  menu :parent => "Inventario"
  
  #filtrar los resultados
  controller do
    def scoped_collection
      Inventory.where(:state => "limpia")
    end
  end
  ## Index ##
  index do
    column :descripcion do |ropa_limpia|
            ropa_limpia.location.name
    end
    column :state
    default_actions
  end
  ##
  ## Show ##
  show do
    panel "Inventaries" do
      table_for ropa_limpia.cloths_inventories do
        column "Cantidad" do |cloths_inventories|
          cloths_inventories.amount
        end
        column "Distincion" do |cloths_inventories|
          cloths_inventories.cloth.distintion
        end
        column "Alto" do |cloths_inventories|
          cloths_inventories.cloth.height
        end
        column "Ancho" do |cloths_inventories|
          cloths_inventories.cloth.width
        end
        column "Largo" do |cloths_inventories|
          cloths_inventories.cloth.depth
        end
        column "Color" do |cloths_inventories|
          cloths_inventories.cloth.color
        end
        column "Feston" do |cloths_inventories|
          cloths_inventories.cloth.feston
        end
        column "Tipo" do |cloths_inventories|
          cloths_inventories.cloth.tipo
        end
        column "Categoria" do |cloths_inventories|
          cloths_inventories.cloth.category.name
        end

      end
    end
  end
  action_item do
     link_to "Message Customers"
   end
  ##
  ## Form ##
  form :partial => "register_clean_cloths"
  ##
  
end