class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.references :sender
      t.references :recipient
      
      t.timestamps
    end
  end
end
