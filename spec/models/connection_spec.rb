require 'rails_helper'

RSpec.describe Connection, type: :model do
  subject { Connection.new(integration_id: 1,auth_id: 1) }

  it 'is not valid without an integration' do
    connection = Connection.new(integration_id: nil)
    expect(connection).to_not be_valid
  end

  it 'is not valid without an external field' do
    connection = Connection.new(integration_id: nil)
    expect(connection).to_not be_valid
  end

  it 'is not valid without an integration' do
    connection = Connection.new(auth_id: nil)
    expect(connection).to_not be_valid
  end

  it 'is not valid without an external field' do
    connection = Connection.new(auth_id: nil)
    expect(connection).to_not be_valid
  end

  it 'is valid with an integration' do
    expect(subject).to be_valid
  end

end
