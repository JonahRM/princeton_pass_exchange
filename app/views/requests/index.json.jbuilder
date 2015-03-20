json.array!(@requests) do |request|
  json.extract! request, :id, :event_id, :user_id, :quantity
  json.url request_url(request, format: :json)
end
