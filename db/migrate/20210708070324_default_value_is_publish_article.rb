class DefaultValueIsPublishArticle < ActiveRecord::Migration[5.2]
  def change
  	change_column :articles, :is_publish, :boolean,:default => false
  end
end
