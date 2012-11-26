class Avatar < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :information
  belongs_to :photo
end
