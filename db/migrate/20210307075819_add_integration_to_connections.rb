class AddIntegrationToConnections < ActiveRecord::Migration[5.2]
  def change
    add_reference :connections, :integration, foreign_key: true
  end
end
