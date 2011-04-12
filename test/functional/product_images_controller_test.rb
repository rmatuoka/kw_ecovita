require 'test_helper'

class ProductImagesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProductImage.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProductImage.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProductImage.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to product_image_url(assigns(:product_image))
  end

  def test_edit
    get :edit, :id => ProductImage.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProductImage.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductImage.first
    assert_template 'edit'
  end

  def test_update_valid
    ProductImage.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductImage.first
    assert_redirected_to product_image_url(assigns(:product_image))
  end

  def test_destroy
    product_image = ProductImage.first
    delete :destroy, :id => product_image
    assert_redirected_to product_images_url
    assert !ProductImage.exists?(product_image.id)
  end
end
