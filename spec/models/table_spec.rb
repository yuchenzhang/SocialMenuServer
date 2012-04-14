require 'spec_helper'

describe Table do
  before do
    table = create :table            
  end
  
  it { should belong_to(:restaurant)}
  it { should validate_uniqueness_of(:uuid)}
end
