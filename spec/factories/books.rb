FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    publisher { Faker::Book.publisher }
    published_on { Date.today }
    author_id { Author.pluck(:id).sample }
    user_id { User.pluck(:id).sample }
  end
end
