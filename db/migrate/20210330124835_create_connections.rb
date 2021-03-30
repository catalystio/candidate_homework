# frozen_string_literal: true
class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.string :auth
      t.string :path
      t.references :integration, foreign_key: true

      t.timestamps
    end
  end
end
