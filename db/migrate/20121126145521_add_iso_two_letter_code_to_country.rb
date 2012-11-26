class AddIsoTwoLetterCodeToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :iso_two_letter_code, :string, :limit => 2
  end
end
