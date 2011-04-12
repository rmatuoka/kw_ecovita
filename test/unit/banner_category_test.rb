require 'test_helper'

class BannerCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert BannerCategory.new.valid?
  end
end
