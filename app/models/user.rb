class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authors, dependent: :destroy
  has_many :books, dependent: :destroy
end
