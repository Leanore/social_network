class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_one :information, :dependent => :destroy       
  
  has_many :posts
  has_many :comments
  
  has_many :photo_albums, :dependent => :destroy
  
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
  
  has_many :relationships, :foreign_key => "follower_id", :dependent => :destroy
  has_many :followed_users, :through => :relationships, :source => :followed
  has_many :reverse_relationships, :foreign_key => "followed_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

  attr_accessible :name, :surname, :email, :password, :password_confirmation, :remember_me, :confirmed_at

  validates_presence_of :name, :surname, :email
  
  after_create :build_details

  def build_details
    self.build_information
    self.save!
    self.photo_albums.create(:title => "Main album")
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
end