require 'spec_helper'
require 'models/photo_attached'

describe RestaurantPicture do
  it { should belong_to :restaurant }
  it { should validate_presence_of :restaurant_id }
  it_should_behave_like "photo_attached" 
end
