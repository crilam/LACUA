class Inventory < ActiveRecord::Base
  attr_accessible :location_id, :sub_location
  belongs_to :location
  
  has_many :cloths_inventories
  has_many :cloths, :through => :cloths_inventories

end
