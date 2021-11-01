class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :publisher, presence: true
  validates :published_on, presence: true
end
