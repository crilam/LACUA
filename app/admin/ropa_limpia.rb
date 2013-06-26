ActiveAdmin.register Inventory , :as => "Ropa Limpia" do

  menu :parent => "Inventario", :if => proc{ can? :register_clean_cloths, nil}
  
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
     link_to "Registrar ropa Limpia" , register_clean_cloths_admin_ropa_limpium_path($ID_ROPA_LIMPIA)
  end
    member_action :register_clean_cloths do
      @cloths = Cloth.all
      @inventory=Inventory.find($ID_ROPA_LIMPIA)
    end
    member_action :create_register_clean_cloths,  :method => :post do
      inventory = Inventory.find($ID_ROPA_LIMPIA)

      redirect_to register_clean_cloths_path, notice: 'Error en la solicitud' if params[:items].nil?

      Cloth.transaction       do
        params[:items].each do|i|

          #inventory = Inventory.find(i[:inventory_id])
          cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
          if cloth_inventory
            cloth_inventory.addAmount(i[1][:amount].to_i)
          else
            cloth_inventory = ClothsInventory.new(inventory_id: inventory.id,cloth_id:i[1][:cloth_id], amount:i[1][:amount])
          end
          cloth_inventory.save!
        end
      end
      redirect_to admin_ropa_limpia_path, notice: 'Ropa ingresada'
    end

    action_item do
     link_to "Enviar ropa a piso" , register_clean_cloths_to_location_admin_ropa_limpium_path($ID_ROPA_LIMPIA)
    end
      member_action :register_clean_cloths_to_location do
        @cloths = Cloth.all
        @inventory = Inventory.find($ID_ROPA_LIMPIA)
      end
      member_action :create_register_clean_cloths_to_location,  :method => :post do
        redirect_to register_clean_cloths_to_location_path, notice: 'Error en la solicitud' if params[:items].nil?

        inventory = Inventory.find(params[:inventory][:id])
        inventory_clean = Inventory.find($ID_ROPA_LIMPIA)
        Cloth.transaction       do
          params[:items].each do|i|
            
            cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
            cloth_inventory_clean = ClothsInventory.where(inventory_id: inventory_clean.id, cloth_id: i[1][:cloth_id]).first
            amount = cloth_inventory_clean.sendAmount(i[1][:amount].to_i)
            if cloth_inventory
              cloth_inventory.addAmount(amount)
            else
              cloth_inventory = ClothsInventory.new(inventory_id: inventory.id, cloth_id: i[1][:cloth_id], amount: amount)
            end
            cloth_inventory.save!
            cloth_inventory_clean.save!
          end
        end
        redirect_to admin_ropa_limpia_path, notice: 'Ropa ingresada'
      end

  ##
  ## Form ##

  ## form :partial => "register_clean_cloths"
  ##
  
end