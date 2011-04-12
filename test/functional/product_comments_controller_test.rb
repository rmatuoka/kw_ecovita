require 'test_helper'

class ProductCommentsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ProductComment.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ProductComment.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ProductComment.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to product_comment_url(assigns(:product_comment))
  end

  def test_edit
    get :edit, :id => ProductComment.first
    assert_template 'edit'
  end

  def test_update_invalid
    ProductComment.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ProductComment.first
    assert_template 'edit'
  end

  def test_update_valid
    ProductComment.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ProductComment.first
    assert_redirected_to product_comment_url(assigns(:product_comment))
  end

  def test_destroy
    product_comment = ProductComment.first
    delete :destroy, :id => product_comment
    assert_redirected_to product_comments_url
    assert !ProductComment.exists?(product_comment.id)
  end
end
