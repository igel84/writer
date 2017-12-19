class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :ancestry
      t.string :tags, array: true

      t.timestamps
    end
    add_index :folders, :ancestry
  end
end
