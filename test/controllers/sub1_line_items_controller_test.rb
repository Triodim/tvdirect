require 'test_helper'

class Sub1LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub1_line_item = sub1_line_items(:one)
  end

  test "should get index" do
    get sub1_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_sub1_line_item_url
    assert_response :success
  end

  test "should create sub1_line_item" do
    assert_difference('Sub1LineItem.count') do
      post sub1_line_items_url, params: { sub1_line_item: { product_id: @sub1_line_item.product_id, sub1_category_id: @sub1_line_item.sub1_category_id } }
    end

    assert_redirected_to sub1_line_item_url(Sub1LineItem.last)
  end

  test "should show sub1_line_item" do
    get sub1_line_item_url(@sub1_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub1_line_item_url(@sub1_line_item)
    assert_response :success
  end

  test "should update sub1_line_item" do
    patch sub1_line_item_url(@sub1_line_item), params: { sub1_line_item: { product_id: @sub1_line_item.product_id, sub1_category_id: @sub1_line_item.sub1_category_id } }
    assert_redirected_to sub1_line_item_url(@sub1_line_item)
  end

  test "should destroy sub1_line_item" do
    assert_difference('Sub1LineItem.count', -1) do
      delete sub1_line_item_url(@sub1_line_item)
    end

    assert_redirected_to sub1_line_items_url
  end
end
