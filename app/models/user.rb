class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # validates :api_key, presence: true, uniqueness: true

  has_secure_password
  # has_secure_token :api_key

  before_create :api_key
  # before_create do
  #   self.api_key = SecureRandom.hex(13)
  # end

  def api_key
    SecureRandom.hex(13)
    # SecureRandom.base64.tr('+/=', 'Qrt')
  end
end