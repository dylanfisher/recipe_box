json.array!(@recipes) do |recipe|
  json.extract! recipe, :title, :description, :notes, :acknowledgements, :featured_image, :user_id, :jewel_id, :color_scheme_id
  json.url recipe_url(recipe, format: :json)
end