class AddUserIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :username
    add_index :users, :password_digest
    add_index :users, :session_token
  end
end
