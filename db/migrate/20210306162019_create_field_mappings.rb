class CreateFieldMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :field_mappings do |t|
      t.references :connection, foreign_key: { on_delete: :cascade }
      t.string :local_field, null: false
      t.string :external_field, null: false

      t.timestamps
    end
  end
end
