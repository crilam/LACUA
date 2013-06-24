class HomeController < ApplicationController

  def index


  end
  def clean_cloth_menu

  end
  def dirty_cloth_menu

  end

  def viewCart


  end

  def register_clean_cloths

      @cloths = Cloth.all


  end

  def create_register_clean_cloths

      inventory = Inventory.find($ID_ROPA_LIMPIA)

      redirect_to register_clean_cloths_path, notice: 'Error en la solicitud' if params[:items].nil?

      params[:items].each do|i|

        #inventory = Inventory.find(i[:inventory_id])
        cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
       if cloth_inventory
         cloth_inventory.addAmount(i[1][:amount].to_i)
       else
         ClothsInventory.new(inventory_id: inventory.id,cloth_id:i[1][:cloth_id], amount:i[1][:amount])

       end
      end
        redirect_to home_clean_cloth_menu_path, notice: 'Ropa ingresada'


  end
  def create_register_dirty_cloths

    inventory = Inventory.find($ID_ROPA_SUCIA)

    redirect_to register_clean_cloths_path, notice: 'Error en la solicitud' if params[:items].nil?

    params[:items].each do|i|

      cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
      if cloth_inventory
        cloth_inventory.sendAmount(i[1][:amount].to_i)
      else
        ClothsInventory.new(inventory_id: inventory.id,cloth_id:i[1][:cloth_id], amount:i[1][:amount])

      end
    end
    redirect_to home_dirty_cloth_menu_path, notice: 'Ropa ingresada'
  end

  def generateCart
  end

  def register_dirty_cloth
    @cloths = Cloth.all
  end

end
