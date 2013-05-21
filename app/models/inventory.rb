class Inventory < ActiveRecord::Base
  attr_accessible :amount, :location_id, :sub_location
  has_and_belongs_to_many :clothes

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
