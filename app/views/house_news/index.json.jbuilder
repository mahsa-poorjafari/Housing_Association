json.array!(@house_news) do |house_news|
  json.extract! house_news, :id, :title, :text, :number_Visit, :Important
  json.url house_news_url(house_news, format: :json)
end
