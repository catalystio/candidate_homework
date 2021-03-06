namespace :db do
  desc 'Script to take data added through seed and put it into new data models'
  task custom_seed: :environment do
    Integration.all.each do |integration|
      integration.config['connections'].each do |connection|
        ActiveRecord::Base.transaction do
          auth = connection['auth']
          path = connection['path']
          field_mappings = connection['field_mapping']
          new_auth = Auth.find_or_create_by!(username: auth['username'], password: auth['password'])
          new_connection = Connection.create!(integration_id: integration.id, auth_id: new_auth.id,
                                              host: path['host'], database: path['database'],
                                              table: path['table'])
          field_mappings.each do |field_mapping|
            FieldMapping.create!(local_field: field_mapping[0], external_field: field_mapping[1],
                                 connection_id: new_connection.id)
          end
        end
      rescue StandardError => e
        puts "Error happened while doing custom seed: #{e}"
      end
    end
  end
end
