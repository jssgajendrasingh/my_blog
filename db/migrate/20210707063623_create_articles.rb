class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.boolean :is_publish
      t.integer :user_id

      t.timestamps
    end
  end
end
