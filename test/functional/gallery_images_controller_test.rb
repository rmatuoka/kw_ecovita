require 'test_helper'

class GalleryImagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => GalleryImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    GalleryImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    GalleryImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to gallery_image_url(assigns(:gallery_image))
  end

  def test_edit
    get :edit, :id => GalleryImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    GalleryImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => GalleryImage.first
    assert_template 'edit'
  end

  def test_update_valid
    GalleryImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => GalleryImage.first
    assert_redirected_to gallery_image_url(assigns(:gallery_image))
  end

  def test_destroy
    gallery_image = GalleryImage.first
    delete :destroy, :id => gallery_image
    assert_redirected_to gallery_images_url
    assert !GalleryImage.exists?(gallery_image.id)
  end
end
