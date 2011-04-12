require 'test_helper'

class ProductRecommendedsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProductRecommended.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProductRecommended.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProductRecommended.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to product_recommended_url(assigns(:product_recommended))
  end

  def test_edit
    get :edit, :id => ProductRecommended.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProductRecommended.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductRecommended.first
    assert_template 'edit'
  end

  def test_update_valid
    ProductRecommended.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductRecommended.first
    assert_redirected_to product_recommended_url(assigns(:product_recommended))
  end

  def test_destroy
    product_recommended = ProductRecommended.first
    delete :destroy, :id => product_recommended
    assert_redirected_to product_recommendeds_url
    assert !ProductRecommended.exists?(product_recommended.id)
  end
end
