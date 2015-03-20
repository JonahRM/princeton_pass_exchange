json.array!(@events) do |event|
  json.extract! event, :id, :date, :club_id, :theme, :info
  json.url event_url(event, format: :json)
end
