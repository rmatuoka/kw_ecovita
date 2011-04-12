require 'test_helper'

class ProductImageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProductImage.new.valid?
  end
end
