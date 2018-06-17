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

BRANDS = [
  {
    name: 'Dell',
    address: 'One Dell Way',
    state: 'TX',
    city: 'Round Rock',
    zip_code: '78682',
    phone_number: '1-800-624-9897',
    website: 'https://www.dell.com'
  },
  {
    name: 'Apple',
    address: 'One Apple Park Way',
    state: 'CA',
    city: 'Cupertino',
    zip_code: '95014',
    phone_number: '1-800-692-7753',
    website: 'https://www.apple.com'
  },
  {
    name: 'Samsung',
    address: '3655 North First Street',
    state: 'CA',
    city: 'San Jose',
    zip_code: '95134-1713',
    phone_number: '1-800-726-7864',
    website: 'https://www.samsung.com'
  }
]

STATUSES.each do |status|
  Status.find_or_create_by(status)
end
CATEGORIES.each do |category|
  Category.find_or_create_by(category)
end
BRANDS.each do |brand|
  Brand.find_or_create_by(brand)
end
