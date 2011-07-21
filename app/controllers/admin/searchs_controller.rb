class Admin::SearchsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  
  layout "admin"
  
  def index
    if params[:keyword].blank?
      @Orders = Order.all(:include =>[:user], :order => 'id DESC').paginate :page => params[:page],:per_page => 50
    else
      @Orders = Order.search_for(params[:keyword]).paginate :page => params[:page],:per_page => 50
    end
  end

  def show
    @Orders = Order.all(:include =>[:user], :order => 'id DESC', :conditions => ['user_id = ?', params[:id]]).paginate :page => params[:page],:per_page => 50
  end
    
  def results
    if !params[:keyword].blank?
      @Results = Order.search_for(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.first.order_products
      end
    end
  end
  
  def resend
    if !params[:cod].blank?
      $Order = Order.all(:conditions=>['id = ? and ((status = "completed") or (status = "approved"))',params[:cod]])
      if $Order.count == 0
        flash[:notice] = "Dados informados são invalidos"
      else
        UserMailer.payment_made($Order.first).deliver
        flash[:notice] = "Email Enviado com sucesso!"
      end
    else
      flash[:notice] = "Erro ao processar os dados, ID não informada!"
    end
  end
  
end