class Admin::GalleryImagesController < ApplicationController
  def index
    @gallery_images = GalleryImage.all
  end

  def show
    @gallery_image = GalleryImage.find(params[:id])
  end

  def new
    @gallery_image = GalleryImage.new
  end

  def create
    @gallery_image = GalleryImage.new(params[:gallery_image])
    if @gallery_image.save
      redirect_to @gallery_image, :notice => "Successfully created gallery image."
    else
      render :action => 'new'
    end
  end

  def edit
    @gallery_image = GalleryImage.find(params[:id])
  end

  def update
    @gallery_image = GalleryImage.find(params[:id])
    if @gallery_image.update_attributes(params[:gallery_image])
      redirect_to @gallery_image, :notice  => "Successfully updated gallery image."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gallery_image = GalleryImage.find(params[:id])
    @gallery_image.destroy
    redirect_to gallery_images_url, :notice => "Successfully destroyed gallery image."
  end
end
