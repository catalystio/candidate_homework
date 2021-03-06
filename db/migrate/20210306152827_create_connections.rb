class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :integration, foreign_key: { on_delete: :cascade }
      t.references :auth, foreign_key: true
      t.string :host, null: false
      t.string :database, null: false
      t.string :table, null: false

      t.timestamps
    end
  end
end
