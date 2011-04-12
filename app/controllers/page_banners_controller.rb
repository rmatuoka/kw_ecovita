class PageBannersController < ApplicationController
  def index
    @page_banners = PageBanners.all
  end

  def show
    @page_banners = PageBanners.find(params[:id])
  end

  def new
    @page_banners = PageBanners.new
  end

  def create
    @page_banners = PageBanners.new(params[:page_banners])
    if @page_banners.save
      redirect_to @page_banners, :notice => "Successfully created page banners."
    else
      render :action => 'new'
    end
  end

  def edit
    @page_banners = PageBanners.find(params[:id])
  end

  def update
    @page_banners = PageBanners.find(params[:id])
    if @page_banners.update_attributes(params[:page_banners])
      redirect_to @page_banners, :notice  => "Successfully updated page banners."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page_banners = PageBanners.find(params[:id])
    @page_banners.destroy
    redirect_to page_banners_url, :notice => "Successfully destroyed page banners."
  end
end
