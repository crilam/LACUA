class Inventory < ActiveRecord::Base
  attr_accessible :location_id, :sub_location
  belongs_to :location
  has_and_belongs_to_many :cloths
  has_many :cloths_inventories

end
