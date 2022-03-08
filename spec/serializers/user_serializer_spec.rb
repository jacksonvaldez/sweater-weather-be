require 'rails_helper'

RSpec.describe UserSerializer do

  describe 'self.user_created' do
    it 'returns the correct hash' do
      api_key = SecureRandom.hex
      user = User.new(email: "something@website.com", password: 'password123', password_confirmation: 'password123')
      user.api_key = api_key
      user.save!

      expected = {
        data: {
          type: 'users',
          id: user.id,
          attributes: {
            email: 'something@website.com',
            api_key: api_key
          }
        }
      }

      expect(UserSerializer.show(user, user.api_key)).to eq(expected)
    end
  end

end
