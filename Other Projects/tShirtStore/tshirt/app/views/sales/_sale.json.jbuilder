json.extract! sale, :id, :customer_id, :saledate, :salenotes, :created_at, :updated_at
json.url sale_url(sale, format: :json)
