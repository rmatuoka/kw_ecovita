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
          if order.pagseguro_id.blank?
            $first = true
          else
            $first = false
          end
          order.payment_type = notification.payment_method
          order.status = notification.status
          order.shipping = notification.shipping_type
          order.pagseguro_id = notification.transaction_id

          #GRAVA ENDEREÇOS
          puts notification.buyer[:name]
          order.zipcode = notification.buyer[:address][:postal_code]
          order.street = notification.buyer[:address][:street]
          order.number = notification.buyer[:address][:number]
          order.complement = notification.buyer[:address][:complements]
          order.neighbourood = notification.buyer[:address][:neighbourhood]
          order.city = notification.buyer[:address][:city]
          order.state = notification.buyer[:address][:state]
          order.area_code = notification.buyer[:phone][:area_code]
          order.phone = notification.buyer[:phone][:number]

          order.save
          
          if order.status.to_s.include? 'completed' or order.status.to_s.include? 'approved'
            UserMailer.payment_made(order).deliver
            UserMailer.order_completed(order).deliver
          else
            if $first
              UserMailer.transaction_initiated(order).deliver
              UserMailer.order_start(order).deliver
            end
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
