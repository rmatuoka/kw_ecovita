class OrderProductsController < ApplicationController
  def index
    @order_products = OrderProduct.all
  end

  def show
    @order_product = OrderProduct.find(params[:id])
  end

  def new
    @order_product = OrderProduct.new
  end

  def create
    @order_product = OrderProduct.new(params[:order_product])
    if @order_product.save
      redirect_to @order_product, :notice => "Successfully created order product."
    else
      render :action => 'new'
    end
  end

  def edit
    @order_product = OrderProduct.find(params[:id])
  end

  def update
    @order_product = OrderProduct.find(params[:id])
    if @order_product.update_attributes(params[:order_product])
      redirect_to @order_product, :notice  => "Successfully updated order product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order_product.destroy
    redirect_to order_products_url, :notice => "Successfully destroyed order product."
  end
end
