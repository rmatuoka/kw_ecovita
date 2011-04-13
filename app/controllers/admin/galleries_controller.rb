class Admin::GalleriesController < ApplicationController
  before_filter :load_page
  def index
    @galleries = @page.galleries.all
  end

  def show
    @gallery = @page.galleries.find(params[:id])
  end

  def new
    @gallery = @page.galleries.build
  end

  def create
    @gallery = @page.galleries.build(params[:gallery])
    if @gallery.save
      redirect_to admin_page_gallery_path(@page, @gallery), :notice => "Successfully created gallery."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery = @page.galleries.find(params[:id])
  end

  def update
    @gallery = @page.galleries.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to admin_page_gallery_path(@page, @gallery), :notice  => "Successfully updated gallery."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery = @page.galleries.find(params[:id])
    @gallery.destroy
    redirect_to admin_page_galleries_path(@page), :notice => "Successfully destroyed gallery."
  end
  
  def load_page
    @page = Page.find(params[:page_id])
  end
end
