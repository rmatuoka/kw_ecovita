class DeliveriesController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :load_cart
  
  def index
  end
end
