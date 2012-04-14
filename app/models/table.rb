class Table < ActiveRecord::Base
  belongs_to :restaurant
  validates_uniqueness_of :uuid, :on => :create, :message => "has already been taken"

end
