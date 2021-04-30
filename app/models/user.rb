class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :password, :email, :password_confirmation
  validates_uniqueness_of :username, :email
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :written_by
end
