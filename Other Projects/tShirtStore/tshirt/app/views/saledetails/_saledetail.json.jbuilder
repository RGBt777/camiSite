json.extract! saledetail, :id, :sale_id, :product_id, :saleprice, :prodqty, :created_at, :updated_at
json.url saledetail_url(saledetail, format: :json)
