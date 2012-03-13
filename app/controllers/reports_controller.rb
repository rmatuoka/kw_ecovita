class ReportsController < ApplicationController
  layout "blank"
  def index
    if !params[:vendasconcluidas].blank?
        if params[:vendasconcluidas] == "enviar"
            @vendasefetuadas = Order.all(:conditions=>['(`orders`.`status` ="completed" or `orders`.`status` ="approved") and (`orders`.`order_send_mail` <> "1")'])
            if @vendasefetuadas.count > 0
              UserMailer.reports(@vendasefetuadas).deliver
              flash[:notice] = "Dados enviados com sucesso!"
              @vendasefetuadas.each do |venda|
                venda.order_send_mail = true
                venda.save
              end 
            else
              flash[:notice] = "Não existem dados para enviar!"
            end
         else
           flash[:notice] = "Parametro invalido!"
         end
      else
        flash[:notice] = "Paramentro não foi passado!"
      end
  end
end
