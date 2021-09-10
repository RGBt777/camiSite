json.extract! product, :id, :productname, :productimage, :description, :color, :size, :subcategory1, :saleprice, :status, :purchaseprice, :qtyonhand, :reorderpoint, :reorderqty, :created_at, :updated_at
json.url product_url(product, format: :json)
