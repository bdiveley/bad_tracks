class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates_presence_of :password, require: true

  has_secure_password

  enum role: %w(default admin)
end
