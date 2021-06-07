logger = Logger.new(STDERR)

namespace :field_mappings do
  desc <<~DESC
    Change field_mappings to a hash
    with local_field and exernal_field keys
  DESC

  task update: :environment do
    puts "Updating field mappings ......"

    Integration.find_each(batch_size: 1000) do |integration|
      connections = []
      
      integration.config['connections'].each do |connection|
        field_mappings = []

        connection['field_mapping'].each do |field_mapping|
          field_mapping = { 
            local_field: field_mapping.first,
            external_field: field_mapping.second
          }

          field_mappings << field_mapping
        end
         
        connection['field_mapping'] = field_mappings
        connections << connection
         
        integration.update(config: { connections: connections })
        
      rescue StandardError => e
        logger.error "Error: #{e}"
      end
    end

    puts "Finished updating field mappings!"
  end
end
