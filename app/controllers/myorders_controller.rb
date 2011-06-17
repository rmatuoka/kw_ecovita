class MyordersController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :load_cart, :logado
  
  def index
    @myorders = current_user.orders
  end
end
