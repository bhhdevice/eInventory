FactoryBot.define do
  factory :employee do
    first_name "John"
    last_name "Smith"
    sequence :employee_number do |n|
      "EN#{n.to_s.rjust(5, '0')}"
    end
    status
    job_title
    department
    location
    disable_login true
    sequence :email do |n|
      "john.smith#{n}@test.com"
    end
  end
end
