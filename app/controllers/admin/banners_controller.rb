class Admin::BannersController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  before_filter :load_category
  layout "admin"
  
  def index
    @banners = @category.banners.all
  end

  def show
    @banner = @category.banners.find(params[:id])
  end

  def new
    @banner = @category.banners.build
  end

  def create
    @banner = @category.banners.build(params[:banner])
    if @banner.save
      redirect_to admin_banner_category_banner_path(@category, @banner), :notice => "Successfully created banner."
    else
      render :action => 'new'
    end
  end

  def edit
    @banner = @category.banners.find(params[:id])
  end

  def update
    @banner = @category.banners.find(params[:id])
    if @banner.update_attributes(params[:banner])
      redirect_to admin_banner_category_banner_path(@category, @banner), :notice  => "Successfully updated banner."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner = @category.banners.find(params[:id])
    @banner.destroy
    redirect_to admin_banner_category_banner_path(@category), :notice => "Successfully destroyed banner."
  end

  def load_category
    @category = BannerCategory.find(params[:banner_category_id])
  end
end
