require 'test_helper'

class ProductCommentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ProductComment.new.valid?
  end
end
