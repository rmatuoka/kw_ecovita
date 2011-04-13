class Admin::ProductsController < ApplicationController
  before_filter :load_category
  def index
    @products = @category.products.all
  end

  def show
    @product = @category.products.find(params[:id])
  end

  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.build(params[:product])
    if @product.save
      redirect_to admin_category_product_path(@category, @product), :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = @category.products.find(params[:id])
  end

  def update
    @product = @category.products.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_category_product_path(@category, @product), :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to admin_category_products_path(@category), :notice => "Successfully destroyed product."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
  end
end
