namespace :data_migration do
  # One time task, remove this task after running on all the environments.
  desc 'Migrate data from integrations config to connections and field_mappings tables'
  task integrations_config_transfer: :environment do
    Integration.transaction do
      Integration.find_each(batch_size: 100) do |integration|
        connections = integration.config.with_indifferent_access.fetch(:connections, [])
        connections.each do |connection|
          field_mappings = connection.delete(:field_mapping)
          c = Connection.create!(config: connection, integration_id: integration.id)
          field_mappings.each do |f_m|
            FieldMapping.create!(config: f_m, connection_id: c.id)
          end
        end
        Rails.logger.info "Integrations_config_transfer: Total connections moved: #{connections.size} for integration: #{integration.id}"
      end
    end
  rescue StandardError => e
    Rails.logger.info  "Integrations_config_transfer: Unable to perform migration due to #{e.inspect}"
    raise e
  end
end
