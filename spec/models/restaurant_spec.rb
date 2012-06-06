require "spec_helper"

describe Restaurant do
  before do 
    @restaurant = create :restaurant      
  end
  it { should belong_to :city }
  it { should have_many :dishes }
  it { should have_many :tables }
  it { should have_many :pictures}
  it { should have_many :orders}
  it { should validate_uniqueness_of :uuid }
  it { should validate_presence_of :city }
  
  describe "add_picture_from_file" do
    it "should add a RestaurantPicture instance when called with a file" do
      expect{@restaurant.add_picture_from_file(File.open(File.join(Rails.root,"images/dish","tapas.jpg")))}.to change{@restaurant.pictures.count}.by(1)
    end
  end
end
