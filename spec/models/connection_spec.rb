# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Connection, type: :model do
  context 'when connection does not have an associated integration record' do
    let!(:connection_without_integration) { FactoryBot.build(:connection) }

    it 'is not valid' do
      expect(connection_without_integration).not_to be_valid
    end
  end

  context 'when connection has an associated integration record' do
    let!(:integration) { FactoryBot.create(:integration) }
    let!(:connection_with_integration) { FactoryBot.build(:connection, integration: integration) }

    it 'is valid' do
      expect(connection_with_integration).to be_valid
    end
  end
end
