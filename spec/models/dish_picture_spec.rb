require 'spec_helper'
require 'models/photo_attached'

describe DishPicture do
  it {should belong_to :dish}
  it {should validate_presence_of :dish_id}
  it_should_behave_like "photo_attached"
end
