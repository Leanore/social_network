class Country < ActiveRecord::Base
  attr_accessible :title, :iso_two_letter_code
  has_many :cities
end
