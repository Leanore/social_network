class Message < ActiveRecord::Base
  attr_accessible :title, :content, :sender, :recipient, :sender_id, :recipient_id
  
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  
end
