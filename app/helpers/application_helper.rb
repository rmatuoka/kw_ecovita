module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper
  
  def data_atual_extenso
    return Date.today.strftime("%d").to_s + " de " + busca_mes(Date.today.strftime("%m").to_i) + " de " +  Date.today.strftime("%y").to_s
  end
  
  def hora_atual_resumida
    return Time.now.strftime("%H") + "h" + Time.now.strftime("%M") + "m"
  end
  
  def busca_mes(mes)
        meses = Array.new  
        meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]  
        return meses[mes - 1]
  end
  
  def print_active(print_status)  
    retorno = ""
    if print_status
      retorno = "Sim"
    else
      retorno = "Não"
    end
    return retorno
  end  
  
  def traduz_status_do_pedido(status)
    
    retorno = ""
    case status
      when "completed"
        retorno = "Completo"
      
       when "incompleted"
          retorno = "Incompleto"
    
      when "pending"
        retorno = "Aguardando Pagamento"
        
      when "approved"
        retorno = "Aprovado"
        
      when "verifying"
        retorno = "Em Análise"
        
      when "canceled"
        retorno = "Cancelado"
        
      when "refunded"
        retorno = "Devolvido"
    end
    
    return retorno
  end
  
  def traduz_tipo_do_pagamento(tipo)
    retorno = ""
    case tipo 
      when "credit_card"
        retorno = "Cartão de Crédito"
    
      when "invoice"
        retorno = "Boleto"
        
      when "pagseguro"
        retorno = "Transferência entre Pagseguro"
        
      when "online_transfer"
        retorno = "Pagamento Online"
        
      when "donation"
        retorno = "Doação"

    end
    
    return retorno
  end
end
