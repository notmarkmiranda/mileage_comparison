class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :login, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :logs
end
