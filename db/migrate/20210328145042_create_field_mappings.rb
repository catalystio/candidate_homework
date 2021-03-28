class CreateFieldMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :field_mappings do |t|
      t.string :local_field
      t.string :external_field
      t.references :connection, foreign_key: true

      t.timestamps
    end
  end
end
