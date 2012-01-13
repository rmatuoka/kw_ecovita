class ProductCommentsController < ApplicationController
  #before_filter :load_product
  def new
    
  end
  
  def create
    @comentario = ProductComment.new(params[:product_comment])
    @comentario.name = current_user.nome
    @comentario.email = current_user.email
    @comentario.save
    redirect_to produto_path(params[:product_comment][:product_id])
  end
end
