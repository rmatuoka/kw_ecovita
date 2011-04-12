require 'test_helper'

class ProductRecommendedTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProductRecommended.new.valid?
  end
end
