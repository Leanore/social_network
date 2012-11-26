class Post < ActiveRecord::Base
  attr_accessible :content, :posted_date
  
  has_many :comments, :dependent => :destroy
  belongs_to :user
end
