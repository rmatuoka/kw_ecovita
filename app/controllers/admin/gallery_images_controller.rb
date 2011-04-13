class Admin::GalleryImagesController < ApplicationController
  before_filter :load_page
  
  def index
    @gallery_images = @gallery.gallery_images.all
  end

  def show
    @gallery_image = @gallery.gallery_images.find(params[:id])
  end

  def new
    @gallery_image = @gallery.gallery_images.build
  end

  def create
    @gallery_image = @gallery.gallery_images.build(params[:gallery_image])
    if @gallery_image.save
      redirect_to admin_page_gallery_gallery_image_path(@page, @gallery, @gallery_image), :notice => "Successfully created gallery image."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery_image = @gallery.gallery_images.find(params[:id])
  end

  def update
    @gallery_image = @gallery.gallery_images.find(params[:id])
    if @gallery_image.update_attributes(params[:gallery_image])
      redirect_to admin_page_gallery_gallery_image_path(@page, @gallery, @gallery_image), :notice  => "Successfully updated gallery image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery_image = @gallery.gallery_images.find(params[:id])
    @gallery_image.destroy
    redirect_to admin_page_gallery_gallery_images_path(@page, @gallery), :notice => "Successfully destroyed gallery image."
  end
  
  def load_page
    @page = Page.find(params[:page_id])
    @gallery = Gallery.find(params[:gallery_id])
  end
end
