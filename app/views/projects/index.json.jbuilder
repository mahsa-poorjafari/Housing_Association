json.array!(@projects) do |project|
  json.extract! project, :id, :title, :address, :description, :Area, :unit, :Status
  json.url project_url(project, format: :json)
end
