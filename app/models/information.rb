class Information < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_one :avatar, :dependent => :destroy    # change maybe!
end
