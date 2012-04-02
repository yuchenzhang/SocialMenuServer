class Table < ActiveRecord::Base
  belongs_to :restaurant
  validates_uniqueness_of :uuid, :on => :create, :message => "must be unique"
  
  def to_json(options = nil)
    super(:only => :number, :include => {:restaurant => {:methods => :to_json}})
  end
end
