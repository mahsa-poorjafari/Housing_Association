json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :user_id, :complaint_text, :complaint_answer
  json.url complaint_url(complaint, format: :json)
end
