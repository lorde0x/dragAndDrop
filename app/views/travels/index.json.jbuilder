json.array!(@travels) do |travel|
  json.extract! travel, :id
  json.url travel_url(travel, format: :json)
end
