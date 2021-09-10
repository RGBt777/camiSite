json.extract! review, :id, :customer_id, :product_id, :reviewdate, :comments, :rating, :status, :created_at, :updated_at
json.url review_url(review, format: :json)
