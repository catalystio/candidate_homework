task migrate_old_field_mappings: :environment do
  Integration.find_each do |integration|
    integration.config['connections'].each do |connection|
      migrate_connection_configs(connection, integration)
    end
  end
end

def migrate_connection_configs(connection_data, integration)
  connection = integration.connections.create(auth: connection_data['auth'], path: connection_data['path'])
  connection_data['field_mapping'].each do |mapping|
    integration.field_mappings.create(connection_id: connection.id, local_field: mapping[0], external_field: mapping[1])
  end
end
