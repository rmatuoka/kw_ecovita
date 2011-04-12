class BannerCategoriesController < ApplicationController
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
      redirect_to @banner_category, :notice => "Successfully created banner category."
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
      redirect_to @banner_category, :notice  => "Successfully updated banner category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @banner_category = BannerCategory.find(params[:id])
    @banner_category.destroy
    redirect_to banner_categories_url, :notice => "Successfully destroyed banner category."
  end
end
