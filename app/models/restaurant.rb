class Restaurant < ActiveRecord::Base
  belongs_to :city
  
  def as_json(options = nil)
    super(:except => [:id, :created_at, :updated_at])
  end
end
