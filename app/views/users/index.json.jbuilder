json.array!(@users) do |user|
  json.extract! user, :id, :club_id, :name, :officer?
  json.url user_url(user, format: :json)
end
