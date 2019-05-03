FactoryBot.define do
  factory :model do
    brand
    category
    sequence(:name) do |n|
      "model#{n}"
    end
    release_date { Date.today }
  end
end
