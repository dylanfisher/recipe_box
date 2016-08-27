types = [
  "Appetizer",
  "Breakfast",
  "Lunch",
  "Dinner",
  "Dessert",
  "Beverage",
]

types.each do |type|
  MealType.find_or_create_by title: type
end
