FactoryBot.define do
  factory :author do
    name { Faker::Book.unique.author }
    user_id { User.pluck(:id).sample }
  end
end
