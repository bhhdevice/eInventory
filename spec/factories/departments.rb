FactoryBot.define do
  factory :department do
    sequence :name do |n|
      "department#{n}"
    end
    cost_center { "V#{Faker::Number.number(3)}" }
  end
end
