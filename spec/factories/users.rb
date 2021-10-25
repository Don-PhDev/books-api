FactoryBot.define do
  factory :user do
    email { Faker::Name.unique.first_name + "@gmail.com" }
    password { "password" }
  end
end
