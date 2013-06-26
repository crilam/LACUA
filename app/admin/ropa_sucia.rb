ActiveAdmin.register Inventory ,:as => "Ropa Sucia"do
  
  menu :parent => "Inventario", :if => proc{ can? :register_dirty_cloths, nil}
  
  #filtrar los resultados  
  controller do
    def scoped_collection
      Inventory.where(:state => "sucia")
    end
  end
  
  index do
    column :descripcion do |ropa_sucia|
            ropa_sucia.location.name
    end
    column :state
    default_actions
  end
  
  show do
    panel "Inventaries" do
      table_for ropa_sucia.cloths_inventories do
        column "Cantidad" do |cloths_inventories|
          cloths_inventories.amount
        end
        column "Nombre" do |cloths_inventories|
          cloths_inventories.cloth.name
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
     link_to "Enviar ropa a lavanderia" , register_dirty_cloths_admin_ropa_sucium_path($ID_ROPA_SUCIA)
  end
    member_action :register_dirty_cloths do
      @cloths = Cloth.all
      @inventory = Inventory.find($ID_ROPA_SUCIA)
    end
    member_action :create_register_dirty_cloths,  :method => :post do
      inventory = Inventory.find($ID_ROPA_SUCIA)

      redirect_to register_dirty_cloths_path, notice: 'Error en la solicitud' if params[:items].nil?

      Cloth.transaction       do
        params[:items].each do|i|

          #inventory = Inventory.find(i[:inventory_id])
          cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
          if cloth_inventory
            cloth_inventory.sendAmount(i[1][:amount].to_i)
            cloth_inventory.save!
          #else
          #  cloth_inventory = ClothsInventory.new(inventory_id: inventory.id,cloth_id:i[1][:cloth_id], amount:i[1][:amount])
          end
          
        end
      end
      redirect_to admin_ropa_sucia_path, notice: 'Ropa enviada!'
    end

    action_item do
     link_to "Registrar ropa de piso" , register_dirty_cloths_to_location_admin_ropa_sucium_path($ID_ROPA_SUCIA)
    end
    member_action :register_dirty_cloths_to_location do
      @cloths = Cloth.all
    end
    member_action :create_register_dirty_cloths_to_location,  :method => :post do

      redirect_to register_dirty_cloths_to_location_path, notice: 'Error en la solicitud' if params[:items].nil?
      inventory = Inventory.find(params[:inventory][:id])
      inventory_dirty = Inventory.find($ID_ROPA_SUCIA)
      
      Cloth.transaction  do
        params[:items].each do|i|
          
          cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
          cloth_inventory_dirty = ClothsInventory.where(inventory_id: inventory_dirty.id, cloth_id: i[1][:cloth_id]).first
          
          if cloth_inventory
            amount = cloth_inventory.sendAmount(i[1][:amount].to_i)
            cloth_inventory.save!
            
            if cloth_inventory_dirty
              cloth_inventory_dirty.addAmount(amount)
            else
              cloth_inventory_dirty = ClothsInventory.new(inventory_id: inventory_dirty.id, cloth_id: i[1][:cloth_id], amount: amount)
            end                 
          
          end
          cloth_inventory_dirty.save!  
        end
        redirect_to admin_ropa_sucia_path, notice: 'Ropa ingresada'
      end
    end

    ##
  ## Form ##

  ## form :partial => "register_dirty_cloths"
  ##
end
