class User < ApplicationRecord
  has_secure_password

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :api_key_digest, presence: true
end
