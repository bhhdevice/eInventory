FactoryBot.define do
  factory :job_title do
    sequence :name do |n|
      "job title#{n}"
    end
  end
end
