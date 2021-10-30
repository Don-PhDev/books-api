FactoryBot.define do
  factory :user do
    email { Faker::Name.unique.first_name.downcase + "@gmail.com" }
    password { "password" }
  end
end
