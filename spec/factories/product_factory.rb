FactoryBot.define do
  sequence(:name) {|n| "TestProduct#{n}"}
  
  factory :product do
    name 
    description "Test"
    price 5.00
  end
end