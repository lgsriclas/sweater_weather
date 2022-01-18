require 'rails_helper'

RSpec.describe 'User', type: :model do
  describe 'validations' do
    it 'validates presence of email' do
      user_1 = User.create(email: 'snoopy@peanuts.com')
      expect(user_1).to validate_presence_of(:email)
    end

    it 'validates uniqueness of email' do
      user_1 = User.create(email: 'snoopy@peanuts.com')

      expect(user_1).to validate_uniqueness_of(:email)
    end

    it 'validates presence of password' do
      user_1 = User.create(email: 'snoopy@peanuts.com')

      expect(user_1).to validate_presence_of(:password)
    end
  end
end