class RemoveDataFromRights < ActiveRecord::Migration
  def up
    remove_column :rights, :user_comments_delete_own
    remove_column :rights, :user_comments_delete_all
    add_column :rights, :owned_rights, :text
  end

  def down
    add_column :rights, :user_comments_delete_own, :integer
    add_column :rights, :user_comments_delete_all, :integer
    remove_column :rights, :owned_rights
  end
end
