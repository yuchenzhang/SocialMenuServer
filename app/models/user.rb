class User < ActiveRecord::Base
  has_many :orders
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar
  has_attached_file :avatar, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates :name, :presence => true
  
  def as_json(options=nil)
    {:id => self.id, :name => self.name, :email => self.email, 
      :avatar => self.avatar.url(:medium),
      :authentication_token => self.authentication_token}
  end
end
