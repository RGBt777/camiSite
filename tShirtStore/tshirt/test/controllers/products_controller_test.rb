require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { color: @product.color, description: @product.description, productimage: @product.productimage, productname: @product.productname, purchaseprice: @product.purchaseprice, qtyonhand: @product.qtyonhand, reorderpoint: @product.reorderpoint, reorderqty: @product.reorderqty, saleprice: @product.saleprice, size: @product.size, status: @product.status, subcategory1: @product.subcategory1 } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { color: @product.color, description: @product.description, productimage: @product.productimage, productname: @product.productname, purchaseprice: @product.purchaseprice, qtyonhand: @product.qtyonhand, reorderpoint: @product.reorderpoint, reorderqty: @product.reorderqty, saleprice: @product.saleprice, size: @product.size, status: @product.status, subcategory1: @product.subcategory1 } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
