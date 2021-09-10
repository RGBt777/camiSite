require 'test_helper'

class SaledetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saledetail = saledetails(:one)
  end

  test "should get index" do
    get saledetails_url
    assert_response :success
  end

  test "should get new" do
    get new_saledetail_url
    assert_response :success
  end

  test "should create saledetail" do
    assert_difference('Saledetail.count') do
      post saledetails_url, params: { saledetail: { prodqty: @saledetail.prodqty, product_id: @saledetail.product_id, sale_id: @saledetail.sale_id, saleprice: @saledetail.saleprice } }
    end

    assert_redirected_to saledetail_url(Saledetail.last)
  end

  test "should show saledetail" do
    get saledetail_url(@saledetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_saledetail_url(@saledetail)
    assert_response :success
  end

  test "should update saledetail" do
    patch saledetail_url(@saledetail), params: { saledetail: { prodqty: @saledetail.prodqty, product_id: @saledetail.product_id, sale_id: @saledetail.sale_id, saleprice: @saledetail.saleprice } }
    assert_redirected_to saledetail_url(@saledetail)
  end

  test "should destroy saledetail" do
    assert_difference('Saledetail.count', -1) do
      delete saledetail_url(@saledetail)
    end

    assert_redirected_to saledetails_url
  end
end
