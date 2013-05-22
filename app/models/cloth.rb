class Cloth < ActiveRecord::Base
  attr_accessible :category_id,:name,:description, :color, :depth, :distintion, :feston, :height, :tipo, :width
  has_and_belongs_to_many :inventories
  has_many :cloths_inventories
  belongs_to :category
end
