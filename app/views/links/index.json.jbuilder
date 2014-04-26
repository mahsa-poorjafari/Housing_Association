json.array!(@links) do |link|
  json.extract! link, :id, :title, :web_site
  json.url link_url(link, format: :json)
end
