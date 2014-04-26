json.array!(@users) do |user|
  json.extract! user, :id, :name, :last_name, :phone, :mobile, :birthdate
  json.url user_url(user, format: :json)
end
