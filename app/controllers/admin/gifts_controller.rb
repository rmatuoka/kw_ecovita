class Admin::GiftsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  layout "admin"
  
  def index
    @gifts = Gift.all
  end

  def show
    @gift = Gift.find(params[:id])
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(params[:gift])
    if @gift.save
      redirect_to admin_gift_path(@gift), :notice => "Successfully created gift."
    else
      render :action => 'new'
    end
  end

  def edit
    @gift = Gift.find(params[:id])
  end

  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      redirect_to admin_gift_path(@gifty), :notice  => "Successfully updated gift."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gift = Gift.find(params[:id])
    @gift.destroy
    redirect_to admin_gifts_path, :notice => "Successfully destroyed gift."
  end
end
