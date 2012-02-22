require 'test_helper'

class AdSlotsControllerTest < ActionController::TestCase
  setup do
    @ad_slot = ad_slots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_slots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_slot" do
    assert_difference('AdSlot.count') do
      post :create, ad_slot: @ad_slot.attributes
    end

    assert_redirected_to ad_slot_path(assigns(:ad_slot))
  end

  test "should show ad_slot" do
    get :show, id: @ad_slot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_slot
    assert_response :success
  end

  test "should update ad_slot" do
    put :update, id: @ad_slot, ad_slot: @ad_slot.attributes
    assert_redirected_to ad_slot_path(assigns(:ad_slot))
  end

  test "should destroy ad_slot" do
    assert_difference('AdSlot.count', -1) do
      delete :destroy, id: @ad_slot
    end

    assert_redirected_to ad_slots_path
  end
end
