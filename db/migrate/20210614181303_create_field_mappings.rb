class CreateFieldMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :field_mappings do |t|
      t.jsonb :config,
              default: {},
              comment: 'Arbitrary JSON that the FE will parse to generate layout data'
      t.references :connection, index: true
      t.timestamps
    end
  end
end
