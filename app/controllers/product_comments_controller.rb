class ProductCommentsController < ApplicationController
  #before_filter :load_product
  def new
    
  end
  
  def create
    @comentario = ProductComment.new(params[:product_comment])
    @comentario.save
    redirect_to produto_path(params[:product_comment][:product_id])
  end
end
