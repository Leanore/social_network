class Post < ActiveRecord::Base
  attr_accessible :content, :posted_date, :user_id
  
  has_many :comments, :dependent => :destroy
  belongs_to :user
end
