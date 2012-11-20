class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :user_id
      t.integer :country_id
      t.integer :city_id
      t.date :date_of_birth
      t.string :gender, :limit => 1
      t.text :about, :limit => 500
      
      t.timestamps
    end
  end
end
