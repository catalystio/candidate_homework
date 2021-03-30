# frozen_string_literal: true
require 'rails_helper'
load File.join(Rails.root, 'Rakefile')

describe 'back fill integrations data' do
  let!(:integration) do
    FactoryBot.create(:integration, :even_field_mappings)
  end
  let!(:integration_with_odd_field_mappings) do
    FactoryBot.create(:integration, :odd_field_mappings)
  end

  context 'for a single integration migration' do
    before do
      expect(integration.connections.size).to eq(0)
      Rake::Task.define_task(:environment)
      Rake::Task['integrations_config_data:migrate_connections'].execute
      integration_with_odd_field_mappings.reload
      integration.reload
    end
    it 'should move config#connections to Integration#Connections' do
      expect(integration.connections.size).to eq(2)
      expect(integration.connections.first).to have_attributes(
        auth: {
          username: 'postgres',
          password: 'postgres'
        },
        path: {
          host: 'localhost',
          database: 'analytics',
          table: 'users'
        }
      )
    end

    it 'should move config#fieldmappings to Integration#FieldMappings' do
      integration.connections.each do |connection|
        expect(connection.field_mappings.size).to eq(3)
      end
      expect(integration.connections.first.field_mappings.first).to have_attributes(
        local_field: 'user_local_field_1',
        external_field: 'user_external_field_1'
      )
    end

    it 'should move odd config#fieldmappings to Integration#FieldMappings' do
      integration_with_odd_field_mappings.connections.each do |connection|
        expect(connection.field_mappings.size).to eq(3)
      end
      expect(integration_with_odd_field_mappings.connections.first.field_mappings.last).to have_attributes(
        local_field: 'user_local_field_3',
        external_field: nil
      )
    end
  end
end
