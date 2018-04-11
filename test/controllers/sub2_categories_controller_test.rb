require 'test_helper'

class Sub2CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub2_category = sub2_categories(:one)
  end

  test "should get index" do
    get sub2_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_sub2_category_url
    assert_response :success
  end

  test "should create sub2_category" do
    assert_difference('Sub2Category.count') do
      post sub2_categories_url, params: { sub2_category: { name: @sub2_category.name, sub1_category_id: @sub2_category.sub1_category_id, url: @sub2_category.url } }
    end

    assert_redirected_to sub2_category_url(Sub2Category.last)
  end

  test "should show sub2_category" do
    get sub2_category_url(@sub2_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub2_category_url(@sub2_category)
    assert_response :success
  end

  test "should update sub2_category" do
    patch sub2_category_url(@sub2_category), params: { sub2_category: { name: @sub2_category.name, sub1_category_id: @sub2_category.sub1_category_id, url: @sub2_category.url } }
    assert_redirected_to sub2_category_url(@sub2_category)
  end

  test "should destroy sub2_category" do
    assert_difference('Sub2Category.count', -1) do
      delete sub2_category_url(@sub2_category)
    end

    assert_redirected_to sub2_categories_url
  end
end
