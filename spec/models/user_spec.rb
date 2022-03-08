require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validations' do
    it { should have_secure_password }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:api_key) }
  end

  before(:each) do
    @user = User.create(email: 'email@email.com', password: 'password123', password_confirmation: 'password123')
  end

  it 'exists' do
    expect(@user).to be_a(User)
  end

  it 'has attributes' do
    expect(@user.password_digest).to be_a(String)
    expect(@user.email).to be_a(String)
  end

  it 'doesnt create user if password and password_confirmation are not the same' do
    user_new = User.create(email: 'email@email.com', password: 'something', password_confirmation: 'something something')

    expect(user_new.valid?).to eq(false)
  end

end
