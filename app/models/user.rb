class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # validates :api_key, presence: true, uniqueness: true

  has_secure_password
  # has_secure_token :api_key
  def self.api_key
    SecureRandom.base64.tr('+/=', 'Qrt')
  end
end