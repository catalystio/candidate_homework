class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :path
      t.string :username
      t.string :password
      t.references :integration, foreign_key: true

      t.timestamps
    end
    add_index :connections, :path
  end
end
