json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :bank_draft_no
  json.url payment_url(payment, format: :json)
end
