class Order < ActiveRecord::Base 
  belongs_to :user
  belongs_to :restaurant
  has_and_belongs_to_many :dishes
  
  validates :user, :presence => true
  validates :restaurant, :presence => true
  validates :status, :inclusion => {:in => %w( pending submitted confirmed reopened closed canceled  ), :message => "extension %s is not included in the list"}
  
  attr_protected :status
  before_validation :add_status
  
  private
  def add_status
    self.status ||= 'pending'
  end 
end
