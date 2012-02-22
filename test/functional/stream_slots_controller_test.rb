require 'test_helper'

class StreamSlotsControllerTest < ActionController::TestCase
  setup do
    @stream_slot = stream_slots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stream_slots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stream_slot" do
    assert_difference('StreamSlot.count') do
      post :create, stream_slot: @stream_slot.attributes
    end

    assert_redirected_to stream_slot_path(assigns(:stream_slot))
  end

  test "should show stream_slot" do
    get :show, id: @stream_slot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stream_slot
    assert_response :success
  end

  test "should update stream_slot" do
    put :update, id: @stream_slot, stream_slot: @stream_slot.attributes
    assert_redirected_to stream_slot_path(assigns(:stream_slot))
  end

  test "should destroy stream_slot" do
    assert_difference('StreamSlot.count', -1) do
      delete :destroy, id: @stream_slot
    end

    assert_redirected_to stream_slots_path
  end
end
