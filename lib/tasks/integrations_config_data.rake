# frozen_string_literal: true
namespace :integrations_config_data do
  desc 'Migrate Integration#config to Integration#Connections and FieldMappings'
  task migrate_connections: :environment do
    Integration.transaction do
      Integration.find_each(batch_size: 1000) do |integration|
        integration.config['connections'].each do |config_connection|
          auth = config_connection['auth']
          path = config_connection['path']

          # avoid creating duplicates in case this task gets run multiple times
          connection = integration.connections.find_or_create_by!(auth: { username: auth['username'],
                                                                          password: auth['password'] },
                                                                  path: { host: path['host'],
                                                                          database: path['database'],
                                                                          table: path['table'] })

          config_connection['field_mapping'].each do |mapping|
            # field_mappings don't create duplicates
            next if connection.field_mappings.exists?(local_field: mapping[0], external_field: mapping[1])

            field_mapping = connection.field_mappings.new(local_field: mapping[0],
                                                          external_field: mapping[1])
            unless field_mapping.save!
              Rails.logger.error "failed to create field mapping with error #{field_mapping.errors.to_sentence}"
            end
          end
        end
      end
    end
  end

end
