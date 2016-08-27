types = [
  "Weekday",
  "Party",
  "Group dinner",
  "Potluck",
  "Indulging",
  "Holiday",
]

types.each do |type|
  Occasion.find_or_create_by title: type
end
