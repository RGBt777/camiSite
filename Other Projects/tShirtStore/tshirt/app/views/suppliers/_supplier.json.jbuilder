json.extract! supplier, :id, :companyname, :pointofcontact, :website, :phone, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
