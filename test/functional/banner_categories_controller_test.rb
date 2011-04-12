require 'test_helper'

class BannerCategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => BannerCategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    BannerCategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    BannerCategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to banner_category_url(assigns(:banner_category))
  end

  def test_edit
    get :edit, :id => BannerCategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    BannerCategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => BannerCategory.first
    assert_template 'edit'
  end

  def test_update_valid
    BannerCategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => BannerCategory.first
    assert_redirected_to banner_category_url(assigns(:banner_category))
  end

  def test_destroy
    banner_category = BannerCategory.first
    delete :destroy, :id => banner_category
    assert_redirected_to banner_categories_url
    assert !BannerCategory.exists?(banner_category.id)
  end
end
