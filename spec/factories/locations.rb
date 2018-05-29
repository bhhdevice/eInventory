FactoryBot.define do
  factory :location do
    sequence :name do |n|
      "location#{n}"
    end
    address "123 test st"
    city "test"
    state "MA"
    zip_code "12345"
    phone_number "1234567890"
  end
end
