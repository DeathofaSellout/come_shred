json.array!(@spots) do |spot|
  json.extract! user, :latitude, :longitude, :address, :features, :comments, :name
  json.url user_url(user, format: :json)
end
