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
    name: 'L&D Shop',
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
    name: 'sle-tech'
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
  },
  {
    name: 'Kaka'
  },
  {
    name: 'Ugreen'
  },
  {
    name: 'Sandisk',
    address: '951 SanDisk Drive',
    state: 'CA',
    city: 'Milpitas',
    zip_code: '95035-7933',
    phone_number: '1-866-726-3475',
    website: 'https://www.sandisk.com/'
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

MODELS = [
  {
    name: "Galaxy Tab E",
    number: "SM-T567V",
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
  },
  {
    name: "iSmart 4-port USB Charger",
    number: "USRP-PC026B",
    release_date: Date.new(2016, 12, 14),
    brand: Brand.where(name: 'Ravpower').first,
    category: Category.where(name: 'Charger').first,
    size: "3.5x1.0x2.8 inches",
    weight: "4.8 ounces",
    website: "https://www.amazon.com/gp/product/B01N7JSB9E"
  },
  {
    name: "Micro USB cables 2-pack",
    number: "RAMPOWMIC07",
    release_date: Date.new(2016, 7, 6),
    brand: Brand.where(name: 'Rampow').first,
    category: Category.where(name: 'Cable').first,
    size: "3.6x0.9x3.2 inches",
    weight: "2.4 ounces",
    website: "https://www.amazon.com/gp/product/B01GJC4WRO"
  },
  {
    name: "Lighting to USB A Cable",
    number: "L6LMF020-CS-R",
    release_date: Date.new(2015, 9, 3),
    brand: Brand.where(name: 'Amazon Basics').first,
    category: Category.where(name: 'Cable').first,
    size: "72x0.3x0.2 inches",
    weight: "2.4 ounces",
    website: "https://www.amazon.com/gp/product/B010S9N6OO"
  },
  {
    name: "iCrews Stylus 10-pack",
    number: "GHY-5241H",
    release_date: Date.new(2015, 7, 22),
    brand: Brand.where(name: 'L&D SHOP').first,
    category: Category.where(name: 'Miscellaneous').first,
    size: "5x0.3x2.5 inches",
    weight: "0.64 ounces",
    website: "https://www.amazon.com/gp/product/B012BOZHAU"
  },
  {
    name: "Defender series for iPhone 5/5s/SE",
    number: "77-38960",
    release_date: Date.new(2014, 4, 12),
    brand: Brand.where(name: 'Otterbox').first,
    category: Category.where(name: 'Case').first,
    size: "7.6x1.6x6 inches",
    weight: "6.7 ounces",
    website: "https://www.amazon.com/gp/product/B00HT6GFX4"
  },
  {
    name: "Defender series for iPhone 6/6s",
    number: "77-52182",
    release_date: Date.new(2015, 9, 25),
    brand: Brand.where(name: 'Otterbox').first,
    category: Category.where(name: 'Case').first,
    size: "9.1x6.4x1.8 inches",
    weight: "8 ounces",
    website: "https://www.amazon.com/gp/product/B00Z7SHCC4"
  },
  {
    name: "Compact bluetooth mouse",
    number: "910-004432",
    release_date: Date.new(2015, 10, 11),
    brand: Brand.where(name: 'Logitech').first,
    category: Category.where(name: 'Mouse').first,
    size: "3x2x1 inches",
    weight: "4 ounces",
    website: "https://www.amazon.com/gp/product/B0148NPIQK"
  },
  {
    name: "65W AC Adapter for E6440, E6540, E7240, E7440",
    number: "HK65NM130",
    release_date: Date.new(2016, 6, 29),
    brand: Brand.where(name: 'Dell').first,
    category: Category.where(name: 'Charger').first,
    size: "6x6x3 inches",
    weight: "10.7 ounces",
    website: "https://www.amazon.com/gp/product/B01EF2Q97G"
  },
  {
    name: "Samsung Galaxy Tab E 9.6 Case w/ Keyboard",
    number: "CEN0874US",
    release_date: Date.new(2016, 1, 23),
    brand: Brand.where(name: 'Fintie').first,
    category: Category.where(name: 'Case').first,
    size: "9.8x7.7x1 inches",
    weight: "1.15 pounds",
    website: "https://www.amazon.com/gp/product/B01A6N9HB8"
  },
  {
    name: "Samsung Galaxy Tab E 9.6 Hardened Case",
    number: "B071GMWMFY",
    release_date: Date.new(2017, 5, 25),
    brand: Brand.where(name: 'Kaka').first,
    category: Category.where(name: 'Case').first,
    size: "8.8x5.5x0.7 inches",
    weight: "6.7 ounces",
    website: "https://www.amazon.com/gp/product/B071GMWMFY"
  },
  {
    name: "Battery for E6420-E6440",
    number: "4328560434",
    release_date: Date.new(2015, 8, 20),
    brand: Brand.where(name: 'SLE-TECH').first,
    category: Category.where(name: 'Battery').first,
    size: "9.5x3.6x1.2 inches",
    weight: "12 ounces",
    website: "https://www.amazon.com/gp/product/B0146IJU0C"
  },
  {
    name: "2.5\" 250GB Evo 860",
    number: "MZ-76E250B/AM",
    release_date: Date.new(2018, 1, 23),
    brand: Brand.where(name: 'Samsung').first,
    category: Category.where(name: 'Storage').first,
    storage_capacity: "250GB",
    storage_type: "V-NAND 3bit MLC",
    size: "3.94x2.76x0.27 inches",
    weight: "3 ounces",
    website: "https://www.samsung.com/us/computing/memory-storage/solid-state-drives/ssd-860-evo-2-5--sata-iii-250gb-mz-76e250b-am/"
  },
  {
    name: "M.2 250GB Evo 860",
    release_date: Date.new(2018, 1, 23),
    brand: Brand.where(name: 'Samsung').first,
    category: Category.where(name: 'Storage').first,
    storage_capacity: "250GB",
    storage_type: "V-NAND 3bit MLC",
    size: "3.15x0.87x0.09 inches",
    weight: "2.88 ounces",
    website: "https://www.samsung.com/us/computing/memory-storage/solid-state-drives/ssd-860-evo-m-2-sata-250gb-mz-n6e250bw/"
  },
  {
    name: "2.5\" 256GB SSDnow",
    release_date: Date.new(2015, 1, 1),
    brand: Brand.where(name: 'Kingston').first,
    category: Category.where(name: 'Storage').first,
    storage_capacity: "256GB",
    storage_type: "NAND",
    size: "2.75x3.94x0.28 inches",
    weight: "2.11 ounces"
  },
  {
    name: "USB Keyboard",
    release_date: Date.new(2017, 1, 1),
    brand: Brand.where(name: 'Dell').first,
    category: Category.where(name: 'Keyboard').first
  },
  {
    name: "USB Mouse",
    release_date: Date.new(2017, 1, 1),
    brand: Brand.where(name: 'Dell').first,
    category: Category.where(name: 'Mouse').first
  },
  {
    name: "OTG USB to micro usb Cable",
    release_date: Date.new(2018, 1, 1),
    brand: Brand.where(name: 'Ugreen').first,
    category: Category.where(name: 'Cable').first,
    website: "https://www.amazon.com/gp/product/B00N9S9Z0G"
  },
  {
    name: "32GB Flash Drive",
    number: "SDCZ48-032G-UAM46",
    release_date: Date.new(2018, 1, 1),
    brand: Brand.where(name: 'Sandisk').first,
    category: Category.where(name: 'Storage').first,
    storage_capacity: "32GB",
    storage_type: "Flash",
    size: "0.4x0.87x0.31 inches",
    weight: "0.32 ounces",
    website: "https://www.amazon.com/gp/product/B00KYK2AKO"
  }
]

MODELS.each do |model|
  Model.find_or_create_by(model)
end
