class CarrinhosController < ApplicationController
  before_filter :load_site_categories, :load_cart
  layout "interna"
  
  def index
    if !params[:gift_cod].empty?
      #VALE PRESENTE
      @gift = Gift.find_by_code(params[:gift_cod])
      
      if @gift
        #ACHOU
        @total_final = @cart.total_price - @gift.discount
      else
        #NAO ACHOU
        @total_final = @cart.total_price
      end
    end
  end
  
  def empty_cart
    session[:cart] = nil
    redirect_to carrinhos_path
  end
end
