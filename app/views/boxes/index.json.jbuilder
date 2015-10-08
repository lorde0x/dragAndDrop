json.array!(@boxes) do |box|
  json.extract! box, :id, :user_id, :weight, :description, :image, :departure_address, :departure_long, :departure_lat, :arr_address, :arr_lat, :arr_long, :expiration
  json.url box_url(box, format: :json)
end
