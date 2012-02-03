class Admin::ProductCommentsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  #before_filter :load_category
  layout "admin"
  
  def index
    @product_comments = ProductComment.all
  end

  def show
    @product_comment = ProductComment.find(params[:id])
  end

  def edit
    @product_comment = ProductComment.find(params[:id])
  end

  def update
    @product_comment = ProductComment.find(params[:id])
    if @product_comment.update_attributes(params[:product_comment])
      redirect_to admin_product_comments_path, :notice  => "Successfully updated product comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_comment = ProductComment.find(params[:id])
    @product_comment.destroy
    redirect_to redirect_to admin_product_comments_path, :notice => "Successfully destroyed product comment."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @product = @subcategory.products.find(params[:product_id])
  end
end
