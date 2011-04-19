class CategoriasController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :before, :load_cart
  
  def show
    @subcategorias = @categoria.subcategories.all
  end
  
  def before
    @categoria = Category.find(params[:id])
  end
end
