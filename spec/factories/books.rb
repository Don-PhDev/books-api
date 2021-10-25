FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    publisher { Faker::Name.unique.name }
    published_on { Date.today }
    author_id { Author.pluck(:id).sample }
    user_id { User.pluck(:id).sample }
  end
end
