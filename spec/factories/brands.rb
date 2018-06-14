FactoryBot.define do
  factory :brand do
    sequence :name do |n|
      "brand#{n}"
    end
    address "123 test st"
    city "test"
    state "MA"
    zip_code "12345"
    phone_number "123-456-7890"
  end
end
