class MigrateDataToConnectionAndFieldMapping < ActiveRecord::Migration[5.2]
  def up
    ActiveRecord::Base.transaction do
      Integration.find_each do |integration|
        integration.config["connections"].each do |connection|
          create_connection!(
            { 
              integration_id: integration.id,
              password: connection["auth"]["password"],
              username: connection["auth"]["username"],
              host: connection["path"]["host"],
              table: connection["path"]["table"],
              database: connection["path"]["database"]
            }
          )
          connection["field_mapping"].each do |field|
            create_field_mapping!(
              {
                connection_id: Connection.last.id,
                local_field: field[0],
                external_field: field[1]
              }
            )
          end
        end
      end
    end
  end

  def down
    Connection.delete_all
    FieldMapping.delete_all
  end

  private
  
  def create_connection!(params)
    Connection.create!(params)
  end

  def create_field_mapping!(params)
    FieldMapping.create!(params)
  end
  
end
