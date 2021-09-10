json.extract! reorder, :id, :product_id, :supplier_id, :qtyorder, :reorderdate, :expecteddelivery, :created_at, :updated_at
json.url reorder_url(reorder, format: :json)
