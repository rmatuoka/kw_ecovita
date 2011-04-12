require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert OrderProduct.new.valid?
  end
end
