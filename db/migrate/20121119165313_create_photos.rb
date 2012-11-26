class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id  #was removed
      t.text :content     
      t.date :posted_date
      t.string :url
      t.timestamps
    end
  end
end
