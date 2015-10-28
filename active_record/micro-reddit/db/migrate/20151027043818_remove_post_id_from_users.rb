class RemovePostIdFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :comment_id
  	remove_column :users, :post_id
  end
end
