require 'test_helper'

class PageBannersTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert PageBanners.new.valid?
  end
end
