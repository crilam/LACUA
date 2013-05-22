class ClothsInventory < ActiveRecord::Base
  	attr_accessible :amount, :inventory_id, :cloth_id
  	
  	belongs_to :inventory
	  belongs_to :cloth
end
