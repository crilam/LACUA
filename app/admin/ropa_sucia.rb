ActiveAdmin.register Inventory ,:as => "Ropa Sucia"do
  
  menu :parent => "Inventario"
  
  #filtrar los resultados  
  controller do
    def scoped_collection
      Inventory.where(:state => "sucia")
    end
  end
  
  index do
    column :descripcion do |inventory|
            inventory.location.name
    end
    column :state
    default_actions
  end
  
  show do
    panel "Inventaries" do
      table_for inventory.cloths_inventories do
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
  
end
