class PhotoAlbum < ActiveRecord::Base
  attr_accessible :title
  
  belongs_to :user
  has_many :photos
end
