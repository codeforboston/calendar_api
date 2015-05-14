json.array!(@sources) do |source|
  json.extract! source, :id, :name, :format, :url, :approved
  json.url source_url(source, format: :json)
end
