module ProdutosHelper
  def star_button(f, product, value, checked)
      radio_button_tag("rating[#{product.id}]", value, checked, :class => 'star')
    end
end
