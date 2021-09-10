require 'test_helper'

class TrandetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trandetail = trandetails(:one)
  end

  test "should get index" do
    get trandetails_url
    assert_response :success
  end

  test "should get new" do
    get new_trandetail_url
    assert_response :success
  end

  test "should create trandetail" do
    assert_difference('Trandetail.count') do
      post trandetails_url, params: { trandetail: { prodqty: @trandetail.prodqty, product_id: @trandetail.product_id, saleprice: @trandetail.saleprice, transaction_id: @trandetail.transaction_id } }
    end

    assert_redirected_to trandetail_url(Trandetail.last)
  end

  test "should show trandetail" do
    get trandetail_url(@trandetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_trandetail_url(@trandetail)
    assert_response :success
  end

  test "should update trandetail" do
    patch trandetail_url(@trandetail), params: { trandetail: { prodqty: @trandetail.prodqty, product_id: @trandetail.product_id, saleprice: @trandetail.saleprice, transaction_id: @trandetail.transaction_id } }
    assert_redirected_to trandetail_url(@trandetail)
  end

  test "should destroy trandetail" do
    assert_difference('Trandetail.count', -1) do
      delete trandetail_url(@trandetail)
    end

    assert_redirected_to trandetails_url
  end
end
