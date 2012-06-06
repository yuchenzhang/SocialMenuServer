require 'spec_helper'

describe City do
  before do
    create :city
  end
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name}
end
