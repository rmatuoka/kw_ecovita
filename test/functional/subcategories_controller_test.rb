require 'test_helper'

class SubcategoriesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Subcategory.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Subcategory.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Subcategory.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to subcategory_url(assigns(:subcategory))
  end

  def test_edit
    get :edit, :id => Subcategory.first
    assert_template 'edit'
  end

  def test_update_invalid
    Subcategory.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Subcategory.first
    assert_template 'edit'
  end

  def test_update_valid
    Subcategory.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Subcategory.first
    assert_redirected_to subcategory_url(assigns(:subcategory))
  end

  def test_destroy
    subcategory = Subcategory.first
    delete :destroy, :id => subcategory
    assert_redirected_to subcategories_url
    assert !Subcategory.exists?(subcategory.id)
  end
end
