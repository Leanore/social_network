class AddSomeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, :null => false
    add_column :users, :surname, :string, :null => false
  end
end
