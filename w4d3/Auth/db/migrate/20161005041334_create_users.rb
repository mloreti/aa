class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :password_digest, unique: true
      t.string :session_token, unique: true

      t.timestamps
    end
  end
end
