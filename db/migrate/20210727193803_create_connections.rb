class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.references :integration, null: false
      t.string :username, null: false
      t.string :password, null: false # Needs to be encrypted
      t.string :host, null: false
      t.string :database, null: false
      t.string :table, null: false

      t.timestamps

      # Indexes
      t.index :username
    end
  end
end
