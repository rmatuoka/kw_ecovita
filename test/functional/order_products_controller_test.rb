require 'test_helper'

class OrderProductsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => OrderProduct.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    OrderProduct.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    OrderProduct.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to order_product_url(assigns(:order_product))
  end

  def test_edit
    get :edit, :id => OrderProduct.first
    assert_template 'edit'
  end

  def test_update_invalid
    OrderProduct.any_instance.stubs(:valid?).returns(false)
    put :update, :id => OrderProduct.first
    assert_template 'edit'
  end

  def test_update_valid
    OrderProduct.any_instance.stubs(:valid?).returns(true)
    put :update, :id => OrderProduct.first
    assert_redirected_to order_product_url(assigns(:order_product))
  end

  def test_destroy
    order_product = OrderProduct.first
    delete :destroy, :id => order_product
    assert_redirected_to order_products_url
    assert !OrderProduct.exists?(order_product.id)
  end
end
