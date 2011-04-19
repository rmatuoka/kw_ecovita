class RatingsController < ApplicationController
  def create
      @produto = Product.find_by_id(params[:product_id])
      if @produto.rate_it(params[:rating][@produto.id.to_s], current_user.id)
        
        #respond_to do |format|
        #  format.html { redirect_to produto_path(@produto), :notice => "Your rating has been saved" }
        #  format.js
        #end
      end
      redirect_to produto_path(@produto)
    end
end
