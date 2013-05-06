class Inventory < ActiveRecord::Base
  attr_accessible :amount, :location_id, :sub_location
  has_and_belongs_to_many :clothes
end
