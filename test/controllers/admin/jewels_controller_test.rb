require 'test_helper'

class Admin::JewelsControllerTest < ActionController::TestCase
  setup do
    @jewel = jewels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jewels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jewel" do
    assert_difference('Jewel.count') do
      post :create, jewel: { title: @jewel.title }
    end

    assert_redirected_to admin_jewel_path(assigns(:jewel))
  end

  test "should show jewel" do
    get :show, id: @jewel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jewel
    assert_response :success
  end

  test "should update jewel" do
    patch :update, id: @jewel, jewel: { title: @jewel.title }
    assert_redirected_to admin_jewel_path(assigns(:jewel))
  end

  test "should destroy jewel" do
    assert_difference('Jewel.count', -1) do
      delete :destroy, id: @jewel
    end

    assert_redirected_to admin_jewels_path
  end
end
