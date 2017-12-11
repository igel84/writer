class AddAppIdTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :app_id, :string, default: ''
    add_column :users, :token, :string, default: ''
  end
end
