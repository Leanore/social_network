class Avatar < ActiveRecord::Base
  attr_accessible :photo_id
  belongs_to :information
  belongs_to :photo
end
