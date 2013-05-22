class HomeController < ApplicationController


  def viewCart


  end

  def registerCleanCloths

      @cloths = Cloth.all


  end

  def createRegisterCleanCloths

      inventory = Inventory.find($ID_ROPA_LIMPIA)
      params[:items].each do|i|

        #inventory = Inventory.find(i[:inventory_id])
        cloth_inventory = ClothsInventory.where(inventory_id: inventory.id, cloth_id: i[1][:cloth_id]).first
       if cloth_inventory
         cloth_inventory.addAmount(i.value)
       else
         ClothsInventory.create(inventory_id: inventory.id,cloth_id:i[1][:cloth_id], amount:i[1][:amount])

       end


     end
  end

  def generateCart
  end

  def registerDirtyCloth
  end

end
