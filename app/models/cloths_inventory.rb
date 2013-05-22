class ClothsInventory < ActiveRecord::Base
  belongs_to :cloth
  belongs_to :inventory
end
