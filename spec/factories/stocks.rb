FactoryBot.define do
  factory :stock do
    association :item, factory: :brand   
  end
end
