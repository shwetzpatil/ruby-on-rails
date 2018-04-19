FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }
  
  factory :user do
    # first_name { (0...5).map { ( 65 + rand(26)).chr }.join }
    # last_name { (0...5).map { ( 65 + rand(26)).chr }.join }
    # email { "#{first_name}.#{last_name}@example.com"  }
    # password "123456"
    # admin false

    email
    password "123456"
    first_name "abc"
    last_name "xyz"
    admin false
    trait :admin do
      admin true
    end
  end

  # factory :admin, class: User do
  #   # email "shwetzpatil@gmail.com"
  #   # password "123456"
  #   # first_name "Admin"
  #   # last_name "User"
  #   # admin true
  # end

end