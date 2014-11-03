FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence :email do |n| 
      "person#{n}@example.com"
    end
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end


