class Inventory < ActiveRecord::Base
  scope :sucia, where(:state => "sucia")
  scope :limpia, where(:state => "limpia")
  
  attr_accessible :location_id, :state
  belongs_to :location
  
  has_many :cloths, :through => :cloths_inventories
  has_many :cloths_inventories

  def name
  	self.location.name
  end

end
