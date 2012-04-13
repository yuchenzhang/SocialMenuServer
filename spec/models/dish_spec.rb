require 'spec_helper'

describe Dish do
  it {should belong_to(:restaurant)}
  
  describe "add_picture_from_file" do
    before do 
      @dish = create :dish 
    end
    it "should add a DishPicture instance when called with a file" do
      expect{@dish.add_picture_from_file(File.open(File.join(Rails.root,"tmp","tapas.jpg")))}.to change{@dish.pictures.count}.by(1)
    end
  end
end
