json.extract! user, :id, :nickname, :level, :kind, :created_at, :updated_at
json.url user_url(user, format: :json)
