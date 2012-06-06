require 'spec_helper'
require 'models/picture_attached'

describe RestaurantPicture do
  it { should belong_to :restaurant }
  it { should validate_presence_of :restaurant }
  it_should_behave_like "picture_attached" 
end
