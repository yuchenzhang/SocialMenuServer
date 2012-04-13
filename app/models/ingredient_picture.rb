class IngredientPicture < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :photo, :presence => true, 
    :size => { :in => 0..10.megabytes }
  belongs_to :ingredient
  validates_presence_of :ingredient_id, :on => :create, :message => "can't be blank"
end
