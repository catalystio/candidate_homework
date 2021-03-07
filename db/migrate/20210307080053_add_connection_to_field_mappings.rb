class AddConnectionToFieldMappings < ActiveRecord::Migration[5.2]
  def change
    add_reference :field_mappings, :connection, foreign_key: true
  end
end
