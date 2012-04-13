require "spec_helper"

describe Restaurant do
  before do 
    @resto = create :restaurant
    @json = JSON.parse @resto.to_json
  end
  it { should belong_to(:city) }
  it { should have_many(:dishes) }
  it { should have_many(:tables) }
  it { should validate_uniqueness_of(:uuid)}
  describe "to_json" do
    it "should not include the id, created and updated timestamp, city_id" do
      @json.has_key?('id').should be_false
      @json.has_key?('created_at').should be_false
      @json.has_key?('updated_at').should be_false
      @json.has_key?('city_id').should be_false
    end
    it "should include the name, the address lines and the geo location" do
      @json.has_key?('name').should be_true
      @json.has_key?('address_line_1').should be_true
      @json.has_key?('address_line_2').should be_true
      @json.has_key?('latitude').should be_true
      @json.has_key?('longitude').should be_true
    end
    it "should include the city hash" do
      @json.has_key?('city').should be_true
      assert @json['city'].is_a? Hash
    end
    it "should include the array of dishes" do
      @json.has_key?('dishes').should be_true
      assert @json['dishes'].is_a? Array
    end
  end
  
  describe "add_picture_from_file" do
    it "should add a RestaurantPicture instance when called with a file" do
      expect{@resto.add_picture_from_file(File.open(File.join(Rails.root,"tmp","tapas.jpg")))}.to change{@resto.pictures.count}.by(1)
    end
  end
end
