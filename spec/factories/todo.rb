FactoryGirl.define do
  factory :todo do
    description "Fake description #{n}"
    completed "false"
    user "Ellen Wolfson"
  end
end
