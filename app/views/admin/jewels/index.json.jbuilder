json.array!(@jewels) do |jewel|
  json.extract! jewel, :title
  json.url jewel_url(jewel, format: :json)
end