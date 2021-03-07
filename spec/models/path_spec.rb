require 'rails_helper'

RSpec.describe Path, type: :model do

  subject { Path.new(host: 'localhost', database: 'analytics', table: 'users', connection_id: 1) }

  it 'is not valid without a host' do
    path = Path.new(host: nil)
    expect(path).to_not be_valid
  end

  it 'is not valid without a database' do
    path = Path.new(database: nil)
    expect(path).to_not be_valid
  end

  it 'is not valid without a table' do
    path = Path.new(table: nil)
    expect(path).to_not be_valid
  end

  it 'is not valid without a connection' do
    path = Path.new(connection_id: nil)
    expect(path).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end


end
