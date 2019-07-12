class User < ApplicationRecord
  validates :name, :email, :github_username, :password, presence: true
end
