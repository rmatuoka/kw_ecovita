class Admin::ReportsController < ApplicationController
  layout "admin"
  def index
    
  end
  
  def seen
    @products = Product.all(:order => "views DESC")
  end
  
  def sold
    @products = Product.all(:order => "vendas DESC")
  end
end
