class Cloth < ActiveRecord::Base
  attr_accessible :categoty_id, :color, :depth, :distintion, :feston, :height, :tipo, :widht
  has_and_belongs_to_many :inventories
end
