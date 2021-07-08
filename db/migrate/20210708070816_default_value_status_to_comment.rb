class DefaultValueStatusToComment < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :status, :boolean, :default => false
  end
end
