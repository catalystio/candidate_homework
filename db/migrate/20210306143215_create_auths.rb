class CreateAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :auths do |t|
      t.string :username, null: false
      t.string :password, null: false

      t.index [:username, :password], unique: true

      t.timestamps
    end
  end
end
