class TermsController < ApplicationController
  before_filter :load_site_categories, :load_cart
  layout "interna"
  
  def index
  end
end
