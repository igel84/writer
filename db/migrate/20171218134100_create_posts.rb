class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :text
      t.references :folder, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
