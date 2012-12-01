class Photo < ActiveRecord::Base
  attr_accessible :content, :posted_date, :url

  belongs_to :photo_album
end
