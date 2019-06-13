FactoryBot.define do
  factory :brand do
    sequence :name do |n|
      "brand#{n}"
    end
    sequence :address do |n|
      "#{n} test st"
    end
    city { "test" }
    state { "MA" }
    zip_code { "12345" }
    phone_number { "123-456-7890" }
    website { "https://test.com" }
  end
end
