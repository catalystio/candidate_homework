require 'rails_helper'

RSpec.describe FieldMapping, type: :model do
  it 'is valid with valid attributes' do
    integration = Integration.create(name: 'integration 1')
    auth = Auth.create(username: 'candidate_homework', password: 'postgres')
    connection = Connection.create(integration_id: integration.id, auth_id: auth.id,
                                   host: 'localhost', database: 'analytics', table: 'users')
    field_mapping = FieldMapping.new(connection_id: connection.id, local_field: 'user_local_field_1',
                                     external_field: 'user_external_field_1')

    expect(field_mapping).to be_valid
  end

  it 'is not valid with wrong attribtes' do
    field_mapping = FieldMapping.new

    expect(field_mapping).to_not be_valid
    expect(field_mapping.errors[:connection]).to include('must exist')
    expect(field_mapping.errors[:local_field]).to include("can't be blank")
    expect(field_mapping.errors[:external_field]).to include("can't be blank")
  end
end
