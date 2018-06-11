# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

STATUSES = [
  {name: 'Active'},
  {name: 'Inactive'},
  {name: 'Medical Leave'},
  {name: 'Resigned'},
  {name: 'Terminated'},
]

CATEGORIES = [
  {name: 'Laptop'},
  {name: 'Tablet'},
  {name: 'Phone'},
  {name: 'Charger'},
  {name: 'Cable'},
  {name: 'Battery'},
  {name: 'Case'},
  {name: 'Storage'},
  {name: 'Keyboard'},
  {name: 'Mouse'},
  {name: 'Miscellaneous'}
]

STATUSES.each do |status|
  Status.find_or_create_by(status)
end



CATEGORIES.each do |category|
  Category.find_or_create_by(category)
end
