class Admin::SearchsController < ApplicationController
  access_control do
    allow :admin, :supervisor
  end
  layout "admin"
  

  def index
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['id > 0'+fstatus+ftype],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50 
  end  

  def show
    fstatus = ' '
    ftype = ' '
    if !params[:status].blank?
      if (ApplicationController.helpers.traduz_status_do_pedido(params[:status]) != '')
        fstatus = " and status = '"+ params[:status]+"'" 
      end
    end
    if !params[:type].blank?
      if (ApplicationController.helpers.traduz_tipo_do_pagamento(params[:type]) != '')
        ftype = " and payment_type = '"+ params[:type]+"'" 
      end
    end    
    
    @Orders = Order.find( :all,
                          :conditions => ['user_id = ?'+fstatus+ftype, params[:id]],
                          :order => 'id DESC',
                          :include =>[:user]
                        ).paginate :page => params[:page],:per_page => 50    
  end

#  def results
#    if !params[:keyword].blank?
#        @Results = Order.find(:all, :conditions => ['id = ?', params[:keyword]])
#        if !@Results.blank?
#          @Results_itens = @Results.first.order_products
#        end
#    end
#  end
  
      
  def results
    if !params[:keyword].blank?
      @Results = Order.search_for(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.first.order_products
      end
    end
  end
  
  def details
    if !params[:keyword].blank?
      @Results = Order.find(params[:keyword])
      
      if !@Results.blank?
        @Results_itens = @Results.order_products
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
  
  def sendmail
    @erro = true
    if !params[:cod].blank?
        @ordersend = Order.all(:conditions => ['id = ?',params[:cod]]) 
        if @ordersend.count > 0
          UserMailer.reports(@ordersend).deliver
          @ordersend.each do |venda|
            venda.order_send_mail = true
            venda.save
          end
          @erro = false      
          classe = ApplicationController.helpers.status_do_pedido(@ordersend.first.status,@ordersend.first.order_send_mail)
          @classe = classe.split("'")
        end
    end
  end
  
end
