class CartItem
  attr_reader :product, :quantity
  
  def initialize(product)
    @product = product
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end
  
  def decrement_quantity
    if @quantity > 0
      @quantity -= 1
    end
  end
  
  def title
    @product.name
  end
  
  def id_product
    @product.id
  end
  
  def price
    if @product.discount.blank?
      @product.price * @quantity
    else
      (@product.price - @product.discount) * @quantity
    end
  end
end