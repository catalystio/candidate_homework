require 'rails_helper'

RSpec.describe Auth, type: :model do
  it 'is valid with valid username and valid password' do
    auth = build(:auth)

    expect(auth).to be_valid
  end

  it 'is not valid without a username' do
    auth = Auth.new(username: nil, password: 'password')

    expect(auth).to_not be_valid
    expect(auth.errors[:username]).to include("can't be blank")
  end

  it 'is not valid without a password' do
    auth = Auth.new(username: 'candidate_homework', password: nil)

    expect(auth).to_not be_valid
    expect(auth.errors[:password]).to include("can't be blank")
  end

  it 'should validate uniqueness of username & password' do
    create(:auth)
    new_auth = Auth.new(username: 'candidate_homework', password: 'postgres')

    expect(new_auth).to_not be_valid
    expect(new_auth.errors[:username]).to include('has already been taken')
  end
end
