def create_users
  User.destroy_all

  10.times do
    users = User.create(
      email: Faker::Name.unique.first_name + "@gmail.com", 
      password: "password"
    )
  end

  p "Created #{User.count} users"
end

def create_authors
  Author.destroy_all

  8.times do
    authors = Author.create(
      name: Faker::Book.unique.author,
      user_id: User.pluck(:id).sample
    )
  end

  p "Created #{Author.count} authors"
end

def create_books
  Book.destroy_all

  30.times do
    books = Book.create(
      title: Faker::Book.unique.title,
      publisher: Faker::Book.publisher,
      published_on: Date.today,
      author_id: Author.pluck(:id).sample,
      user_id: User.pluck(:id).sample
    )
  end

  p "Created #{Book.count} books"
end

create_users
create_authors
create_books
