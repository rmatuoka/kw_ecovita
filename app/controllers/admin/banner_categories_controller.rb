class Admin::BannerCategoriesController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  layout "admin"
  
  def index
    @banner_categories = BannerCategory.all
  end

  def show
    @banner_category = BannerCategory.find(params[:id])
  end

  def new
    @banner_category = BannerCategory.new
  end

  def create
    @banner_category = BannerCategory.new(params[:banner_category])
    if @banner_category.save
      redirect_to admin_banner_category_path(@banner_category), :notice => "Successfully created banner category."
    else
      render :action => 'new'
    end
  end

  def edit
    @banner_category = BannerCategory.find(params[:id])
  end

  def update
    @banner_category = BannerCategory.find(params[:id])
    if @banner_category.update_attributes(params[:banner_category])
      redirect_to admin_banner_category_path(@banner_category), :notice  => "Successfully updated banner category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner_category = BannerCategory.find(params[:id])
    @banner_category.destroy
    redirect_to admin_banner_categories_path, :notice => "Successfully destroyed banner category."
  end
end
