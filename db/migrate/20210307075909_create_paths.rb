class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.string :host
      t.string :database
      t.string :table

      t.timestamps
    end
  end
end
