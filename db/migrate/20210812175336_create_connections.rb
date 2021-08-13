class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :host
      t.string :database
      t.string :table
      t.references :integration, null: false, foreign_key: true
      t.timestamps
    end
  end
end
