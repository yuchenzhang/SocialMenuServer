require 'spec_helper'

describe Dish do
  it {should belong_to :restaurant}
  it {should validate_presence_of :restaurant}
  it {should validate_presence_of :name}
  it {should validate_presence_of :price}
  it {should validate_presence_of :description}
  it {should have_many :reviews}
end
