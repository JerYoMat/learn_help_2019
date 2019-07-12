# frozen_string_literal: true

class User < ApplicationRecord
  before_save {email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save { self.email = email.downcase }
  has_secure_password
  validates :name, :github_username, presence: true, length: { maximum: 255 }
  validates :email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: 6 }
end
