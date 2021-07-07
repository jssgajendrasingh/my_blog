class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :blog_name
      t.integer :post_per_page
      t.boolean :if_maintance

      t.timestamps
    end
  end
end
