FactoryBot.define do
  factory :status do
    sequence :name do |n|
      "Status #{n}"
    end
  end
end
