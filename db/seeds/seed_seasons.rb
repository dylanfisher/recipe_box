types = [
  "Spring",
  "Summer",
  "Fall",
  "Winter",
]

types.each do |type|
  Season.find_or_create_by title: type
end
