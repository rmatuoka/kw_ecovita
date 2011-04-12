require 'test_helper'

class PageBannersControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => PageBanners.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    PageBanners.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    PageBanners.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to page_banners_url(assigns(:page_banners))
  end

  def test_edit
    get :edit, :id => PageBanners.first
    assert_template 'edit'
  end

  def test_update_invalid
    PageBanners.any_instance.stubs(:valid?).returns(false)
    put :update, :id => PageBanners.first
    assert_template 'edit'
  end

  def test_update_valid
    PageBanners.any_instance.stubs(:valid?).returns(true)
    put :update, :id => PageBanners.first
    assert_redirected_to page_banners_url(assigns(:page_banners))
  end

  def test_destroy
    page_banners = PageBanners.first
    delete :destroy, :id => page_banners
    assert_redirected_to page_banners_url
    assert !PageBanners.exists?(page_banners.id)
  end
end
