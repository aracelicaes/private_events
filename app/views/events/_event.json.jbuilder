json.extract! event, :id, :date, :location, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
