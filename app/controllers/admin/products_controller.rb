class Admin::ProductsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  before_filter :load_category
  layout "admin"
  
  def index
    @products = @subcategory.products.all
  end

  def show
    @product = @subcategory.products.find(params[:id])
  end

  def new
    @product = @subcategory.products.build
  end

  def create
    @product = @subcategory.products.build(params[:product])
    if @product.save
      redirect_to admin_category_subcategory_product_path(@category, @subcategory, @product), :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = @subcategory.products.find(params[:id])
  end

  def update
    @product = @subcategory.products.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_category_subcategory_product_path(@category, @subcategory, @product), :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = @subcategory.products.find(params[:id])
    @product.destroy
    redirect_to admin_category_subcategory_products_path(@category, @subcategory), :notice => "Successfully destroyed product."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
  end
end
