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
  def get_amount_of_cloths (cloth)
      cloth_inv=self.cloths_inventories.where(cloth_id: cloth).first
      cloth_inv ? cloth_inv.amount : 0
  end

end
