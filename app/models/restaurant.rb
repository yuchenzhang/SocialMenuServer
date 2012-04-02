class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :tables
  validates_uniqueness_of :uuid, :on => :create, :message => "must be unique"
  def to_json(options = nil)
    super(:except => [:id, :created_at, :updated_at,:uuid, :city_id], :include => {:city => {:only => :name} })
  end
end
