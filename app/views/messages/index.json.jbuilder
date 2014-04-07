json.array!(@messages) do |message|
  json.extract! message, :id, :subject, :text, :visited, :user_name
  json.url message_url(message, format: :json)
end
