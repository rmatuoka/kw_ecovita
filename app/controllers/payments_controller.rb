class PaymentsController < ApplicationController
  before_filter :load_site_categories, :load_cart
  layout "interna"
  #before_filter :autentica, :load_box_package
  skip_before_filter :verify_authenticity_token
  
  def efetuado
    return unless request.post?
      pagseguro_notification do |notification|
        if notification.valid?(:force)
          order = Order.find(notification.order_id)
          order.payment_type = notification.payment_method
          order.status = notification.status
          order.shipping = notification.shipping_type
          order.pagseguro_id = notification.transaction_id
          order.save
          
          if order.status.to_s.include? 'completed'
          #enviar email de confirmação
          #  corpo = "
          #  <b>Nome:</b>#{transaction.nome}<br />
          #  <b>E-mail: </b>#{transaction.email}<br />
          #  "
          #  Email.deliver_agradecimento(transaction.email)
          #  Email.deliver_pedido(@user.email,corpo)
          end
          
          #SETA QUOTES COMO INDIPONIVEL
          #carts = Cart.all(:conditions => ['session_id = ?', transaction.session_id])
          #carts.each do |c|
          #  q = Quote.find(c.quote_id)
          #  q.indisponivel = true
          #  #q.save
          #end
        end
      end
        render :nothing => true
  end
  
  def show
    
  end
end
