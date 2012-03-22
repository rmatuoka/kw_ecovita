class Admin::NewslettersController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end

  layout "admin"  
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new(params[:newsletter])
    if @newsletter.save
      redirect_to [:admin, @newsletter], :notice => "Successfully created newsletter."
    else
      render :action => 'new'
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update_attributes(params[:newsletter])
      redirect_to [:admin, @newsletter], :notice  => "Successfully updated newsletter."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])
    @newsletter.destroy
    redirect_to admin_newsletters_url, :notice => "Successfully destroyed newsletter."
  end
end
