class Book < ApplicationRecord
  has_many :user_books
  has_many :users, through: :user_books

  validates_presence_of :title
end
