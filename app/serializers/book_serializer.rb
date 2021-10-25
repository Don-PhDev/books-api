class BookSerializer
  include JSONAPI::Serializer

  attributes :title, :publisher, :published_on
end
