class Admin::ProductRecommendedsController < ApplicationController
  def index
    @product_recommendeds = ProductRecommended.all
  end

  def show
    @product_recommended = ProductRecommended.find(params[:id])
  end

  def new
    @product_recommended = ProductRecommended.new
  end

  def create
    @product_recommended = ProductRecommended.new(params[:product_recommended])
    if @product_recommended.save
      redirect_to @product_recommended, :notice => "Successfully created product recommended."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_recommended = ProductRecommended.find(params[:id])
  end

  def update
    @product_recommended = ProductRecommended.find(params[:id])
    if @product_recommended.update_attributes(params[:product_recommended])
      redirect_to @product_recommended, :notice  => "Successfully updated product recommended."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_recommended = ProductRecommended.find(params[:id])
    @product_recommended.destroy
    redirect_to product_recommendeds_url, :notice => "Successfully destroyed product recommended."
  end
end
