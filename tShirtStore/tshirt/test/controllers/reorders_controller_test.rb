require 'test_helper'

class ReordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reorder = reorders(:one)
  end

  test "should get index" do
    get reorders_url
    assert_response :success
  end

  test "should get new" do
    get new_reorder_url
    assert_response :success
  end

  test "should create reorder" do
    assert_difference('Reorder.count') do
      post reorders_url, params: { reorder: { expecteddelivery: @reorder.expecteddelivery, product_id: @reorder.product_id, qtyorder: @reorder.qtyorder, reorderdate: @reorder.reorderdate, supplier_id: @reorder.supplier_id } }
    end

    assert_redirected_to reorder_url(Reorder.last)
  end

  test "should show reorder" do
    get reorder_url(@reorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_reorder_url(@reorder)
    assert_response :success
  end

  test "should update reorder" do
    patch reorder_url(@reorder), params: { reorder: { expecteddelivery: @reorder.expecteddelivery, product_id: @reorder.product_id, qtyorder: @reorder.qtyorder, reorderdate: @reorder.reorderdate, supplier_id: @reorder.supplier_id } }
    assert_redirected_to reorder_url(@reorder)
  end

  test "should destroy reorder" do
    assert_difference('Reorder.count', -1) do
      delete reorder_url(@reorder)
    end

    assert_redirected_to reorders_url
  end
end
