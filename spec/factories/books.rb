FactoryBot.define do
  factory :book do
    title { Faker::Book.unique.title }
    publisher { Faker::Book.publisher }
    published_on { Date.today.year-rand(400) }
    author_id { Author.pluck(:id).sample }
    user_id { User.pluck(:id).sample }
  end
end
