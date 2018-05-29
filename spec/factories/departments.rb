FactoryBot.define do
  factory :department do
    sequence :name do |n|
      "department#{n}"
    end
    sequence :cost_center do |n|
      "center#{n}"
    end
  end
end
