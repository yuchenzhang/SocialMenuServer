require 'spec_helper'

describe Table do
  before do
    create :table            
  end
  
  it { should belong_to :restaurant }
  it { should validate_uniqueness_of :uuid}
  it { should validate_presence_of :restaurant}
end
