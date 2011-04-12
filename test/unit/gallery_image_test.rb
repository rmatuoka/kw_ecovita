require 'test_helper'

class GalleryImageTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GalleryImage.new.valid?
  end
end
