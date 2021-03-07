namespace :db do
  namespace :seed do
    task load: :environment do
      Integration.all.each do |integration|
        integration.config['connections'].each_with_index do |connection, index|
          auth = connection['auth']
          path = connection['path']
          field_mappings = connection['field_mapping']
          new_auth = Auth.create!(username: auth['username'], password: auth['password'])
          new_connection = Connection.create!(name: 'Connect ' + (index + 1).to_s,
                                              integration_id: integration.id, auth_id: new_auth.id)
          Path.create!(host: path['host'], database: path['database'],
                       table: path['table'], connection_id: new_connection.id)
          field_mappings.each do |field_mapping|
            FieldMapping.create!(local_field: field_mapping[0], external_field: field_mapping[1],
                                 connection_id: new_connection.id)
          end
        end
      end
    end
  end
end
