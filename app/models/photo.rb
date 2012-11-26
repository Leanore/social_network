class Photo < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :photo_album
  has_one :avatar
end
