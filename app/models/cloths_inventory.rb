class ClothsInventory < ActiveRecord::Base
  attr_accessible :cloth_id, :inventory_id, :amount
  belongs_to :cloth
  belongs_to :inventory
end
