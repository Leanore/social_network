class Comment < ActiveRecord::Base
  attr_accessible :content, :posted_date
  
  belongs_to :post
  belongs_to :user
end
