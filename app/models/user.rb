class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  before_create :api_key

  def api_key
    SecureRandom.base64.tr('+/=', 'Qrt')
  end
end