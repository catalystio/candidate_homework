namespace :db do
  desc "Migrate connections data"
  task migrate_connections: :environment do
    Integration.find_each(batch_size: 1000) do |integration|
      integration.config['connections'].map do |config_connection|
        auth = config_connection['auth']
        path = config_connection['path']

        connection = integration.connections.new(auth: { username: auth['username'],
                                                         password: auth['password']
                                                        },
                                                 path: { host: path['host'],
                                                         database: path['database'],
                                                         table: path['table'] })
        logger.error "faild to create connection with error #{connection.errors.to_sentence}" unless connection.save

        config_connection['field_mapping'].map do |mapping|
          field_mapping = connection.field_mappings.new(local_field: mapping[0],
                                                        external_field: mapping[1])
          logger.error "faild to create field mapping with error #{field_mapping.errors.to_sentence}" unless field_mapping.save
        end
      end
    end
  end
end
