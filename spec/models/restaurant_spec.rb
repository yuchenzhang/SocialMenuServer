require "spec_helper"

describe Restaurant do
  before do 
    @resto = create :restaurant      
  end
  it { should belong_to(:city) }
  it { should have_many(:dishes) }
  it { should have_many(:tables) }
  it { should validate_uniqueness_of(:uuid)}
  
  describe "add_picture_from_file" do
    it "should add a RestaurantPicture instance when called with a file" do
      expect{@resto.add_picture_from_file(File.open(File.join(Rails.root,"tmp","tapas.jpg")))}.to change{@resto.pictures.count}.by(1)
    end
  end
end
