json.array!(@managements) do |management|
  json.extract! management, :id, :name, :last_name, :post, :Work_Experience
  json.url management_url(management, format: :json)
end
