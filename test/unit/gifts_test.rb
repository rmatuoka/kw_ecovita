require 'test_helper'

class GiftsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Gifts.new.valid?
  end
end
