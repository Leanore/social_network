class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :information_id
      t.integer :photo_id
      t.timestamps
    end
  end
end
