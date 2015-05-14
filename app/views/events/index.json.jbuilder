json.array!(@events) do |event|
  json.extract! event, :id, :source_id, :icaluid, :start_date, :end_date, :title, :description, :url, :pricing, :contact_email, :organizer
  json.url event_url(event, format: :json)
end
