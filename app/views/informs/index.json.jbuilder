json.array!(@informs) do |inform|
  json.extract! inform, :id, :title, :text, :number_visit, :important
  json.url inform_url(inform, format: :json)
end
