class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :auth
      t.string :path
      t.references :integration

      t.timestamps
    end
  end
end
