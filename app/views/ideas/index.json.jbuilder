json.array!(@ideas) do |idea|
  json.extract! idea, :id, :latitude, :longitude, :Idea, :Destination, :Start, :End, :Tags
  json.url idea_url(idea, format: :json)
end