require 'rails_helper'

RSpec.describe FieldMapping, type: :model do

  subject { FieldMapping.new(local_field: 'user_local_field_1', external_field: 'user_external_field_1', connection_id: 1) }

  it 'is not valid without a local field' do
    field_mapping = FieldMapping.new(local_field: nil)
    expect(field_mapping).to_not be_valid
  end

  it 'is not valid without an external field' do
    field_mapping = FieldMapping.new(external_field: nil)
    expect(field_mapping).to_not be_valid
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end



end
