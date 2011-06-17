class AccountsController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :load_cart, :logado
  
  def index
    
  end
  
  
end
