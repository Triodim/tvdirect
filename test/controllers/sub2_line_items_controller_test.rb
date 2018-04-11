require 'test_helper'

class Sub2LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub2_line_item = sub2_line_items(:one)
  end

  test "should get index" do
    get sub2_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_sub2_line_item_url
    assert_response :success
  end

  test "should create sub2_line_item" do
    assert_difference('Sub2LineItem.count') do
      post sub2_line_items_url, params: { sub2_line_item: { product_id: @sub2_line_item.product_id, sub2_category_id: @sub2_line_item.sub2_category_id } }
    end

    assert_redirected_to sub2_line_item_url(Sub2LineItem.last)
  end

  test "should show sub2_line_item" do
    get sub2_line_item_url(@sub2_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub2_line_item_url(@sub2_line_item)
    assert_response :success
  end

  test "should update sub2_line_item" do
    patch sub2_line_item_url(@sub2_line_item), params: { sub2_line_item: { product_id: @sub2_line_item.product_id, sub2_category_id: @sub2_line_item.sub2_category_id } }
    assert_redirected_to sub2_line_item_url(@sub2_line_item)
  end

  test "should destroy sub2_line_item" do
    assert_difference('Sub2LineItem.count', -1) do
      delete sub2_line_item_url(@sub2_line_item)
    end

    assert_redirected_to sub2_line_items_url
  end
end
