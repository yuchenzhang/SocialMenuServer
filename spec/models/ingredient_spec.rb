require 'spec_helper'

describe Ingredient do
  describe "add_picture_from_file" do
    before do 
      @ingredient = create :ingredient 
    end
    it "should add a IngredientPicture instance when called with a file" do
      expect{@ingredient.add_picture_from_file(File.open(File.join(Rails.root,"tmp","tapas.jpg")))}.to change{@ingredient.pictures.count}.by(1)
    end
  end
end
