types = [
  "Gluten free",
  "Vegetarian",
  "Vegan",
]

types.each do |type|
  Diet.find_or_create_by title: type
end
