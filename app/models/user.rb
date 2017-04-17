class User < ApplicationRecord
  has_many :user_books
  has_many :books, through: :user_books

  def self.from_github(auth_hash)
    user = User.new
    user.username = auth_hash["info"]["nickname"]
    user.email = auth_hash["info"]["email"]
    user.oauth_uid = auth_hash["uid"]
    user.oauth_provider = "github"
    return user
  end
end
