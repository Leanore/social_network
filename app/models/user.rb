class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_one :information, :dependent => :destroy       
  has_many :posts
  has_many :comments
  has_many :photo_albums
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
  
  after_create :build_details

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :surname, :email, :password, :password_confirmation, :remember_me, :confirmed_at
  # attr_accessible :title, :body
  
  validates_presence_of :name, :surname

  def build_details
    self.build_information
    self.save!
    self.photo_albums.create(:title => "Main album")
  end
end