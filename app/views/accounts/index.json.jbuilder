json.array!(@accounts) do |account|
  json.extract! account, :id, :image, :phone_number, :identity_card
  json.url account_url(account, format: :json)
end
