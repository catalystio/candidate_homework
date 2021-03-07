require 'rails_helper'

RSpec.describe Auth, type: :model do
  subject { Auth.new(username: 'postgres', password: 'postgres') }

  it 'is not valid without a username' do
    auth = Auth.new(username: nil)
    expect(auth).to_not be_valid
  end

  it 'is not valid without a password' do
    auth = Auth.new(password: nil)
    expect(auth).to_not be_valid
  end

  it 'is valid with username and password' do
    expect(subject).to be_valid
  end

end
