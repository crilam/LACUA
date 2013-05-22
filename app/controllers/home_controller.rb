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
        clothInventory =ClothsInventories.where(inventory_id: inventory, cloth_id: i[cloth_id]).first
       if clothInventory
         clothInventory.amount
       end


     end
  end

  def generateCart
  end

  def registerDirtyCloth
  end

end
