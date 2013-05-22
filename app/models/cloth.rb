class Cloth < ActiveRecord::Base
  attr_accessible :category_id,:name,:description, :color, :depth, :distintion, :feston, :height, :tipo, :width
  
  has_many :cloths_inventories
  has_many :inventories, :through => :cloths_inventories 
  belongs_to :category
end
