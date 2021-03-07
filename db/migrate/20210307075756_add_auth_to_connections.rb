class AddAuthToConnections < ActiveRecord::Migration[5.2]
  def change
    add_reference :connections, :auth, foreign_key: true
  end
end
