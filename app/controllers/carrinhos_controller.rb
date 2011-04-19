class CarrinhosController < ApplicationController
  before_filter :load_site_categories, :load_cart
  layout "interna"
  
  def index
    
  end
  
  def empty_cart
    session[:cart] = nil
    redirect_to carrinhos_path
  end
end
