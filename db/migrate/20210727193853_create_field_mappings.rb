class CreateFieldMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :field_mappings do |t|
      t.references :connection, null: false
      t.string :local_field
      t.string :external_field

      t.timestamps

      # Indexes
      t.index :local_field
      t.index :external_field
    end
  end
end
