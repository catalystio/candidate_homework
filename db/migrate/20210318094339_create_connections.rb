class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.jsonb :auth
      t.jsonb :path
      t.belongs_to :integration, foreign_key: true

      t.timestamps
    end
  end
end
