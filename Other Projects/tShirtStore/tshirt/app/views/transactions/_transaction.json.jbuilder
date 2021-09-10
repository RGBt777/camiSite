json.extract! transaction, :id, :customer_id, :saledate, :salesnotes, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
