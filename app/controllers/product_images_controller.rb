class ProductImagesController < ApplicationController
  def index
    @product_images = ProductImage.all
  end

  def show
    @product_image = ProductImage.find(params[:id])
  end

  def new
    @product_image = ProductImage.new
  end

  def create
    @product_image = ProductImage.new(params[:product_image])
    if @product_image.save
      redirect_to @product_image, :notice => "Successfully created product image."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_image = ProductImage.find(params[:id])
  end

  def update
    @product_image = ProductImage.find(params[:id])
    if @product_image.update_attributes(params[:product_image])
      redirect_to @product_image, :notice  => "Successfully updated product image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_image = ProductImage.find(params[:id])
    @product_image.destroy
    redirect_to product_images_url, :notice => "Successfully destroyed product image."
  end
end
