class User < ApplicationRecord
  validates :username, :session_token, presence: true
  validates :password_digest, presence: true, message: "No password give"
  validates :password, length: { minimum: 6, allow_null: true }


end
