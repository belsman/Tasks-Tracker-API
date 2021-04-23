class User < ApplicationRecord
  has_secure_password
  has_many :measurements, dependent: :destroy

  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :username, length: { minimum: 4 }
  validates :password, length: { in: 6..20 }
end
