class Admin::ProductImagesController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  before_filter :load_category
  layout "admin"
  
  def index
    @product_images = @product.product_images.all
  end

  def show
    @product_image = @product.product_images.find(params[:id])
  end

  def new
    @product_image = @product.product_images.new
  end

  def create
    @product_image = @product.product_images.new(params[:product_image])
    if @product_image.save
      redirect_to admin_category_subcategory_product_product_image_path(@category, @subcategory, @product, @product_image), :notice => "Successfully created product image."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_image = @product.product_images.find(params[:id])
  end

  def update
    @product_image = @product.product_images.find(params[:id])
    if @product_image.update_attributes(params[:product_image])
      redirect_to admin_category_subcategory_product_product_image_path(@category, @subcategory,  @product, @product_image), :notice  => "Successfully updated product image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_image = @product.product_images.find(params[:id])
    @product_image.destroy
    redirect_to admin_category_subcategory_product_product_images_path(@category, @subcategory,  @product), :notice => "Successfully destroyed product image."
  end
  
  def load_category
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:subcategory_id])
    @product = @subcategory.products.find(params[:product_id])
  end
end
