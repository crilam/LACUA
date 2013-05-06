class Inventory < ActiveRecord::Base
  attr_accessible :amount, :location_id, :sub_location
end
