namespace :integration_data do
  desc "Copy Integration#config['connections'] to Integration#connections"
  task migrate: :environment do
    Integration.transaction do
      Integration.find_each do |integration|
        integration.config['connections'].each do |config_conn|
          # To avoid creating duplicates if this task gets run multiple times
          # find the connection with the same attributes before creating it
          connection = integration.connections.find_or_create_by(config_conn.slice('auth', 'path'))

          config_conn['field_mapping'].each do |local_field, external_field|
            mapping = { local_field: local_field,
                        external_field: external_field }

            # Filed mappings are uniq per connection so don't create duplicates
            next if connection.field_mappings.exists?(mapping)

            connection.field_mappings.create(mapping)
          end
        end
      end
    end
  end
end
