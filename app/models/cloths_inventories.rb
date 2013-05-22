class ClothsInventories < ActiveRecord::Base
  	attr_accessible :amount
  	belongs_to :inventory
	  belongs_to :cloth
end
