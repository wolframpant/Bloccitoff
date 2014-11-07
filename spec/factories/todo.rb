FactoryGirl.define do
  factory :todo do
    sequence :description, 1 do |n|
      "Fake description #{n}"
    end
    completed false
    user_id 1
  end
end
