json.extract! advertisement, :id, :title, :description, :imagepath, :startdate, :enddate, :created_at, :updated_at
json.url advertisement_url(advertisement, format: :json)
