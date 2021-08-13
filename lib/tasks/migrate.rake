namespace :migrate do
  
  task field_mapping_data: :environment do
    integration = Integration.first
    integration['config']['connections'].each do |conn|
      p conn
      connection = integration.connections.create(host: conn['path']['host'], database: conn['path']['database'], table: conn['path']['table'])
      field_mappings = conn['field_mapping']
      field_mapping_data = []
      field_mappings.each do |field_mapping|
        field_mapping_data << { connection: connection, local_field: field_mapping[0], external_field: field_mapping[1] }
      end
      FieldMapping.create(field_mapping_data) 
    end  
  end 
end

