class AccountsController < ApplicationController
  layout "interna"
  before_filter :load_site_categories, :load_cart, :logado
  
  def index
    
  end
  
  def logado
    if !current_user
      redirect_to root_path
    end
  end
end
