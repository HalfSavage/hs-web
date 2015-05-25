json.array!(@users) do |user|
  json.extract! user, :id, :type, :login, :gender_id, :email, :active
  json.url user_url(user, format: :json)
end
