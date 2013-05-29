class CreateRights < ActiveRecord::Migration
  def change
    create_table :rights do |t|
      t.text :group
      t.string :user_comments_delete_own
      t.string :user_comments_delete_all

      t.timestamps
    end
  end
end
