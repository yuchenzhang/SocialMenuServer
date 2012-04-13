require 'spec_helper'
require 'models/photo_attached'

describe IngredientPicture do
  it { should belong_to :ingredient }
  it { should validate_presence_of :ingredient_id }
  it_should_behave_like "photo_attached" 
end
