require 'rails_helper'

RSpec.describe Connection, type: :model do
  it 'is valid with valid attributes' do
    integration = Integration.create(name: 'integration 1')
    auth = Auth.create(username: 'candidate_homework', password: 'postgres')
    connection = Connection.new(integration_id: integration.id, auth_id: auth.id,
                                host: 'localhost', database: 'analytics', table: 'users')

    expect(connection).to be_valid
  end

  it 'is not valid with wrong attribtes' do
    connection = Connection.new

    expect(connection).to_not be_valid
    expect(connection.errors[:auth]).to include('must exist')
    expect(connection.errors[:integration]).to include('must exist')
    expect(connection.errors[:host]).to include("can't be blank")
    expect(connection.errors[:database]).to include("can't be blank")
    expect(connection.errors[:table]).to include("can't be blank")
  end
end
