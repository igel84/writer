class RenameUsersDatum < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :app_id, :vk_app_id
    rename_column :users, :token, :vk_access_token
  end
end
