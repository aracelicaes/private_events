json.extract! attendance, :id, :user_id, :event_id, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
