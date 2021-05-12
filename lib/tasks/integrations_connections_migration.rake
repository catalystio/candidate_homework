# frozen_string_literal: true
namespace :integrations do
  desc 'Migrate integrations config to use connections and field mappings tables'
  task connections_migration: :environment do
    BATCH_SIZE = ENV.fetch('BATCH_SIZE', 500)

    Integration.find_each(batch_size: BATCH_SIZE) do |integration|
      next if integration.config.nil?

      config = integration.config.with_indifferent_access

      Integration.transaction do
        config[:connections].each do |connection|
          db_connection = integration.connections.find_or_create_by!(auth: auth(connection[:auth]), path: path(connection[:path]))
          connection[:field_mapping].each do |mapping|
            next if db_connection.field_mappings.exists?(local_field: mapping[0], external_field: mapping[1])
  
            field_mapping = db_connection.field_mappings.create!(local_field: mapping[0],
                                                          external_field: mapping[1])
          end
        end
  
        # reset the config column as we don't wan 2 places to hold the same
        integration.update_columns(config: nil)
      end
    end
  end

  def auth(hash)
    {
      username: hash[:username],
      password: hash[:password]
    }
  end

  def path(hash)
    {
      host: hash[:host],
      database: hash[:database],
      table: hash[:table] 
    }
  end
end
