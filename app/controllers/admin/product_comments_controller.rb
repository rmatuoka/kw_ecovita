class Admin::ProductCommentsController < ApplicationController
  before_filter :load_category
  def index
    @product_comments = @product.product_comments.all
  end

  def show
    @product_comment = @product.product_comments.find(params[:id])
  end

  def new
    @product_comment = @product.product_comments.build
  end

  def create
    @product_comment = @product.product_comments.build(params[:product_comment])
    if @product_comment.save
      redirect_to admin_category_product_product_comment_path(@category, @product, @product_comment), :notice => "Successfully created product comment."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_comment = @product.product_comments.find(params[:id])
  end

  def update
    @product_comment = @product.product_comments.find(params[:id])
    if @product_comment.update_attributes(params[:product_comment])
      redirect_to admin_category_product_product_comment_path(@category, @product, @product_comment), :notice  => "Successfully updated product comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_comment = @product.product_comments.find(params[:id])
    @product_comment.destroy
    redirect_to admin_category_product_product_comments_path(@category, @product), :notice => "Successfully destroyed product comment."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:product_id])
  end
end
