# frozen_string_literal: true
require 'rails_helper'

RSpec.describe FieldMapping, type: :model do
  context 'when a field_mapping does not have an associated connection record' do
    let!(:field_mapping_without_connection) { FactoryBot.build(:field_mapping) }

    it 'is not valid' do
      expect(field_mapping_without_connection).not_to be_valid
    end
  end

  context 'when a field_mapping has an associated connection record' do
    let!(:integration) { FactoryBot.create(:integration) }
    let!(:connection) { FactoryBot.create(:connection, integration: integration) }
    let!(:field_mapping_with_connection) do
      FactoryBot.build(:field_mapping, connection: connection)
    end

    it 'is valid' do
      expect(field_mapping_with_connection).to be_valid
    end
  end
end
