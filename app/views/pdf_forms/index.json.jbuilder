json.array!(@pdf_forms) do |pdf_form|
  json.extract! pdf_form, :id, :title, :description
  json.url pdf_form_url(pdf_form, format: :json)
end
