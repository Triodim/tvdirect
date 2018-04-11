require 'test_helper'

class Sub1CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub1_category = sub1_categories(:one)
  end

  test "should get index" do
    get sub1_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_sub1_category_url
    assert_response :success
  end

  test "should create sub1_category" do
    assert_difference('Sub1Category.count') do
      post sub1_categories_url, params: { sub1_category: { category_id: @sub1_category.category_id, name: @sub1_category.name, url: @sub1_category.url } }
    end

    assert_redirected_to sub1_category_url(Sub1Category.last)
  end

  test "should show sub1_category" do
    get sub1_category_url(@sub1_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub1_category_url(@sub1_category)
    assert_response :success
  end

  test "should update sub1_category" do
    patch sub1_category_url(@sub1_category), params: { sub1_category: { category_id: @sub1_category.category_id, name: @sub1_category.name, url: @sub1_category.url } }
    assert_redirected_to sub1_category_url(@sub1_category)
  end

  test "should destroy sub1_category" do
    assert_difference('Sub1Category.count', -1) do
      delete sub1_category_url(@sub1_category)
    end

    assert_redirected_to sub1_categories_url
  end
end
