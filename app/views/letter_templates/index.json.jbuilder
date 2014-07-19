json.array!(@letter_templates) do |letter_template|
  json.extract! letter_template, :id, :name, :content
  json.url letter_template_url(letter_template, format: :json)
end
