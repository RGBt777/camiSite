json.extract! customer, :id, :firstname, :lastname, :email, :phone, :address1, :address2, :city, :state, :zip, :notes, :created_at, :updated_at
json.url customer_url(customer, format: :json)
