class RemoveUserIdFromPhoto < ActiveRecord::Migration
  def up
    remove_column :photos, :user_id
  end

  def down
    add_column :photos, :user_id, :integer
  end
end
