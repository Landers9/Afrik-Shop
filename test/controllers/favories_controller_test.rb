require 'test_helper'

class FavoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favory = favories(:one)
  end

  test "should get index" do
    get favories_url
    assert_response :success
  end

  test "should get new" do
    get new_favory_url
    assert_response :success
  end

  test "should create favory" do
    assert_difference('Favory.count') do
      post favories_url, params: { favory: { product_id: @favory.product_id } }
    end

    assert_redirected_to favory_url(Favory.last)
  end

  test "should show favory" do
    get favory_url(@favory)
    assert_response :success
  end

  test "should get edit" do
    get edit_favory_url(@favory)
    assert_response :success
  end

  test "should update favory" do
    patch favory_url(@favory), params: { favory: { product_id: @favory.product_id } }
    assert_redirected_to favory_url(@favory)
  end

  test "should destroy favory" do
    assert_difference('Favory.count', -1) do
      delete favory_url(@favory)
    end

    assert_redirected_to favories_url
  end
end
