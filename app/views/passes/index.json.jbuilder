json.array!(@passes) do |pass|
  json.extract! pass, :id, :event_id, :user_id, :quantity
  json.url pass_url(pass, format: :json)
end
