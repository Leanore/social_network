class City < ActiveRecord::Base
  attr_accessible :title
  belongs_to :country
  has_many :informations
end
