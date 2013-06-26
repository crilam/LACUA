class ClothsInventory < ActiveRecord::Base
  attr_accessible :cloth_id, :inventory_id, :amount
  belongs_to :cloth
  belongs_to :inventory

  def addAmount(new_amount)
    self.amount = self.amount + new_amount
  end

  def sendAmount(new_amount)
    initial = self.amount
    if self.amount - new_amount < 0
    	self.amount = 0
    else
    	self.amount = self.amount - new_amount
    end
    
    if new_amount > initial
      return new_amount - initial
    else
      return new_amount
    end
  end
end
