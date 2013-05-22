require 'test_helper'

class ClothsInventoriesControllerTest < ActionController::TestCase
  setup do
    @cloths_inventory = cloths_inventories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cloths_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cloths_inventory" do
    assert_difference('ClothsInventory.count') do
      post :create, cloths_inventory: {  }
    end

    assert_redirected_to cloths_inventory_path(assigns(:cloths_inventory))
  end

  test "should show cloths_inventory" do
    get :show, id: @cloths_inventory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cloths_inventory
    assert_response :success
  end

  test "should update cloths_inventory" do
    put :update, id: @cloths_inventory, cloths_inventory: {  }
    assert_redirected_to cloths_inventory_path(assigns(:cloths_inventory))
  end

  test "should destroy cloths_inventory" do
    assert_difference('ClothsInventory.count', -1) do
      delete :destroy, id: @cloths_inventory
    end

    assert_redirected_to cloths_inventories_path
  end
end
