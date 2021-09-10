json.extract! trandetail, :id, :transaction_id, :product_id, :saleprice, :prodqty, :created_at, :updated_at
json.url trandetail_url(trandetail, format: :json)
