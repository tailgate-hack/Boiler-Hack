json.array!(@earthquakes) do |earthquake|
  json.extract! earthquake, :id
  json.url earthquake_url(earthquake, format: :json)
end
