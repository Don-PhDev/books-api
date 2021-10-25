FactoryBot.define do
  factory :book do
    title { "MyString" }
    publisher { "MyString" }
    published_on { "MyString" }
    author { nil }
    user { nil }
  end
end
