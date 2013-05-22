class HomeController < ApplicationController


  def viewCart


  end

  def registerCleanCloths
                  @cloths = Cloth.all


  end

  def generateCart
  end
end
