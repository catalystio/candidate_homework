class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.json :auth
      t.json :path
      t.references :integration, foreign_key: true
      t.timestamps
    end
  end
end
