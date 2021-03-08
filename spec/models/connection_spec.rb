require 'rails_helper'

RSpec.describe Connection, type: :model do
  it 'is valid with valid attributes' do
    connection = build(:connection)

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
