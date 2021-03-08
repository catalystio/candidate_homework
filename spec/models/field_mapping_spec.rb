require 'rails_helper'

RSpec.describe FieldMapping, type: :model do
  it 'is valid with valid attributes' do
    field_mapping = build(:field_mapping)

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
