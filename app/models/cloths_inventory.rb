class ClothsInventory < ActiveRecord::Base
  	attr_accessible :amount, :inventory_id, :cloth_id
  	
  	belongs_to :inventory
	belongs_to :cloth

	def withdraw(value)
		updateAmount(value*-1)
	end

	def addAmount(value)
		updateAmount(value)
	end	


	def updateAmount(value)
		if (amount + value < 0)
			diference = amount + value
			write_attribute(:amount, 0)
			return diference
		else
			write_attribute(:amount, amount + value)
			return amount
		end
	end
end
