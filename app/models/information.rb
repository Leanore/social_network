class Information < ActiveRecord::Base
  attr_accessible :avatar, :photo, :photo_attributes, :photo_id, :country_id, :city_id, :date_of_birth, :gender, :about
    
  belongs_to :user
  belongs_to :city
  has_one :avatar #
  has_one :photo, :dependent => :destroy, :through => :avatar    # change maybe!
  #has_one :photo
  #accepts_nested_attributes_for :photo  #
  
end
