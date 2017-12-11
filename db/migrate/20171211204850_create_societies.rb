class CreateSocieties < ActiveRecord::Migration[5.1]
  def change
    create_table :societies do |t|
      t.string :name
      t.string :alias
      t.string :photo
      t.references :user, foreign_key: true
      t.string :url
      t.string :tags, array: true, default: []
      t.bigint :vk_id

      t.timestamps
    end
  end
end
