# connection:
# {
#   auth: {
#     username: 'postgres',
#     password: 'postgres'
#   },
#   path: {
#     host: 'localhost',
#     database: 'analytics',
#     table: 'users'
#   },
#   field_mapping: [
#     ['user_local_field_1', 'user_external_field_1'],
#     ['user_local_field_2', 'user_external_field_2'],
#     ['user_local_field_3', 'user_external_field_3']
#   ]
# }

logger = Logger.new(STDERR)

namespace :db do
  desc <<~DESC
    Breakdown the data residing in connections jsonb column in integrations 
    table, to the newly created conncections and fieldmappings tables.
  DESC

  task integration_connections_breakdown: :environment do
    puts "Migrating Data ......"

    Integration.find_each(batch_size: 1000) do |integration|
      integration.config['connections'].each do |connection|
        path = [
          connection['path']['host'],
          connection['path']['database'],
          connection['path']['table']
        ].join('.')

        username = connection['auth']['username']
        password = connection['auth']['password']
        field_mappings = connection['field_mapping']

        # create connections and field_mappings
        begin
          connection = integration.connections.create!({
            username: username,
            password:password,
            path: path
          })
          field_mappings.each do |field_mapping|
            connection.field_mappings.create!(
              local_field: field_mapping[0], external_field: field_mapping[1]
            )
          end
        rescue StandardError => e
          logger.error "Error: #{e}"
        end
      end
    end

    puts "Finished Migrating Data!"
  end
end
