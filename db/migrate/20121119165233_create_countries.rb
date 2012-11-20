class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title, :limit => 50
      
      t.timestamps
    end
  end
end
