class ProductCommentsController < ApplicationController
  def index
    @product_comments = ProductComment.all
  end

  def show
    @product_comment = ProductComment.find(params[:id])
  end

  def new
    @product_comment = ProductComment.new
  end

  def create
    @product_comment = ProductComment.new(params[:product_comment])
    if @product_comment.save
      redirect_to @product_comment, :notice => "Successfully created product comment."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_comment = ProductComment.find(params[:id])
  end

  def update
    @product_comment = ProductComment.find(params[:id])
    if @product_comment.update_attributes(params[:product_comment])
      redirect_to @product_comment, :notice  => "Successfully updated product comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_comment = ProductComment.find(params[:id])
    @product_comment.destroy
    redirect_to product_comments_url, :notice => "Successfully destroyed product comment."
  end
end
