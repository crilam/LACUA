class ApplicationController < ActionController::Base
  protect_from_forgery

  # $ID_ROPA_LIMPIA = Inventory.joins(:location).where(:locations=>{codigo: "CRL"}).first.id
  # $ID_ROPA_SUCIA = Inventory.joins(:location).where(:locations=>{codigo: "CRS"}).first.id

  rescue_from CanCan::AccessDenied do |exception|
    puts exception.message
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end 
  
end
