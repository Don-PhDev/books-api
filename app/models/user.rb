class User < ApplicationRecord
  has_secure_password

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  has_many :authors, dependent: :destroy
  has_many :books, dependent: :destroy

  validates :email, presence: true, length: {
    minimum: 2,
    maximum: 30,
    too_short: "Email must have at least 2 characters",
    too_long: "Email must be less than 30 characters"
  }
end
