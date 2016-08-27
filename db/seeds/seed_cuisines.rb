types = [
  "American",
  "Cajun",
  "Caribbean",
  "Chinese",
  "French",
  "German",
  "Greek",
  "Indian",
  "Italian",
  "Japanese",
  "Korean",
  "Lebanese",
  "Mediterranean",
  "Mexican",
  "Moroccan",
  "Serbian",
  "Soul",
  "Spanish",
  "Thai",
  "Turkish",
  "Vietnamese",
]

types.each do |type|
  Cuisine.find_or_create_by title: type
end
