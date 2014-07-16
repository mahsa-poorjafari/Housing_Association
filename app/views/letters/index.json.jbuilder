json.array!(@letters) do |letter|
  json.extract! letter, :id, :letter_type, :summary, :sent_date, :received_date, :sender, :content, :attachment
  json.url letter_url(letter, format: :json)
end
