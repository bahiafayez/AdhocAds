require 'test_helper'

class LiveStreamsControllerTest < ActionController::TestCase
  setup do
    @live_stream = live_streams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:live_streams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create live_stream" do
    assert_difference('LiveStream.count') do
      post :create, live_stream: @live_stream.attributes
    end

    assert_redirected_to live_stream_path(assigns(:live_stream))
  end

  test "should show live_stream" do
    get :show, id: @live_stream
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @live_stream
    assert_response :success
  end

  test "should update live_stream" do
    put :update, id: @live_stream, live_stream: @live_stream.attributes
    assert_redirected_to live_stream_path(assigns(:live_stream))
  end

  test "should destroy live_stream" do
    assert_difference('LiveStream.count', -1) do
      delete :destroy, id: @live_stream
    end

    assert_redirected_to live_streams_path
  end
end
