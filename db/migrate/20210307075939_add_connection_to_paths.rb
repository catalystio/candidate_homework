class AddConnectionToPaths < ActiveRecord::Migration[5.2]
  def change
    add_reference :paths, :connection, foreign_key: true
  end
end
