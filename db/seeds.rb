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
  },
  {
    name: 'iCrews Direct',
    address: 'PO Box 81226',
    state: 'WA',
    city: 'Seattle',
    zip_code: '98108-1226',
    phone_number: '1-888-280-4331',
    website: 'https://www.amazon.com/s?marketplaceID=ATVPDKIKX0DER&me=A29Y2I7EH9XELQ&merchant=A29Y2I7EH9XELQ&redirect=true'
  },
  {
    name: 'Amazon Basics',
    address: 'PO Box 81226',
    state: 'WA',
    city: 'Seattle',
    zip_code: '95134-1713',
    phone_number: '1-800-726-7864',
    website: 'https://www.amazon.com'
  },
  {
    name: 'Ravpower',
    address: '46724 Lakeview Blvd',
    state: 'CA',
    city: 'Fremont',
    zip_code: '94538',
    phone_number: '',
    website: 'https://www.ravpower.com',
    email: 'support@ravpower.com'
  },
  {
    name: 'Rampow',
    website: 'https://www.rampow.com/support',
    email: 'support@rampow.com'
  },
  {
    name: 'Otterbox',
    state: 'CO',
    city: 'Fort Collins',
    zip_code: '80521',
    phone_number: '1-855-688-7269',
    website: 'https://www.otterbox.com'
  },
  {
    name: 'Logitech',
    address: '6505 Kaiser Drive',
    state: 'CA',
    city: 'Fremont',
    zip_code: '94555',
    phone_number: '1-646-454-3200',
    website: 'https://www.logitech.com'
  },
  {
    name: 'Verizon',
    address: '1 Verizon Way',
    state: 'NJ',
    city: 'Basking Ridge',
    zip_code: '07920',
    phone_number: '908-559-2001',
    website: 'https://www.verizon.com'
  },
  {
    name: 'Kingston',
    address: '17600 Newhope Street',
    state: 'CA',
    city: 'Fountain Valley',
    zip_code: '92708',
    phone_number: '1-877-546-4786',
    website: 'https://www.kingston.com'
  },
  {
    name: 'sle tech'
  },
  {
    name: 'Fintie',
    address: '6365 Old Avery Rd #6',
    state: 'OH',
    city: 'Dublin',
    zip_code: '43016',
    phone_number: '1-888-249-8201',
    website: 'https://www.fintie.com',
    email: 'sales@fintie.com'
  },
  {
    name: 'Google',
    address: '1600 Amphitheatre Parkway',
    state: 'CA',
    city: 'Mountain View',
    zip_code: '94043',
    phone_number: '1-855-836-3987',
    website: 'https://www.support.google.com'
  }
]

MODELS = [
  {
    name: "SM-T567V",
    release_date: Date.new(2015, 6, 20),
    brand: Brand.where(name: 'Samsung').first,
    category: Category.where(name: 'Tablet').first,
    processor: "1.3GHz",
    ram: "1.5GB",
    storage_capacity: "16GB",
    storage_type: "Flash MMC",
    display: "9.6\" 800 x 1280 pixels",
    battery_capacity: "5000mAH",
    wifi: "Yes",
    bluetooth: "Yes",
    gps: "Yes",
    cellular: "Verizon 4G LTE",
    camera: "5MP Rear 2MP Front",
    size: "9.52x5.89x0.33 inches",
    weight: "17.28 ounces"
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
MODELS.each do |model|
  Model.find_or_create_by(model)
end
