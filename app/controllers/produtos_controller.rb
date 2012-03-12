class ProdutosController < ApplicationController
  before_filter :load_site_categories, :before, :load_cart
  layout "interna"
  
  def show
    @produto = Product.find(params[:id])
    views = @produto.views + 1
    @recomendados = @produto.recommendeds.all(:conditions => ['`products`.`price` > 0 AND IF(`products`.`stock_control` = 1, `products`.`stock_quantity` > 0 AND `products`.`published` = 1,  `products`.`published` = 1)'])
    @produto.views = views
    @produto.save
  end
  
  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product product
    redirect_to carrinhos_path
  end
  
  def remove_from_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.remove_product product
    redirect_to carrinhos_path
  end
  
  def add_to_wishlist
    @wishlist = current_user.wishlists.build
    @wishlist.user_id = current_user.id
    @wishlist.product_id = params[:id]
    @wishlist.save
    
    redirect_to wishlists_path
  end
  
  def remove_from_wishlist
    @wishlist = current_user.wishlists.first(:conditions => ['user_id = ?', current_user.id])
    @wishlist.destroy
    
    redirect_to wishlists_path
  end
  
  def before
    @produto = Product.find(params[:id])
    @subcategory = @produto.subcategory
    @category = @subcategory.category
    if !@produto.published
      redirect_to home_path
    end
  end
  
  private
  def find_cart
    session[:cart] ||= Cart.new
  end
end
