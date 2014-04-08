json.array!(@cooperatives) do |cooperative|
  json.extract! cooperative, :id, :name, :managment_name, :board_Chairman_name, :address, :phone, :website
  json.url cooperative_url(cooperative, format: :json)
end
