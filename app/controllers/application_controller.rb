class ApplicationController < ActionController::Base
  protect_from_forgery

  $ID_ROPA_LIMPIA =2
  $ID_ROPA_SUCIA =1

  rescue_from CanCan::AccessDenied do |exception|
    puts exception.message
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end 
  
end
