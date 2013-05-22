class Location < ActiveRecord::Base
  attr_accessible :codigo, :name
  has_many :inventories
end
