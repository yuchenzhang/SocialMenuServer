require 'spec_helper'

describe Table do
  before do
    table = create :table
    @json = JSON.parse table.to_json    
  end
  
  it { should belong_to(:restaurant)}
  it { should validate_uniqueness_of(:uuid)}
  describe "json" do
    it "should not include id, created_at, updated_at" do
      @json.has_key?('id').should be_false
      @json.has_key?('created_at').should be_false
      @json.has_key?('updated_at').should be_false
    end
    it "should include table number" do
      @json.has_key?('number').should be_true
    end
    it "should include restaurant" do
      @json.has_key?('restaurant').should be_true
      assert @json['restaurant'].is_a? Hash
    end
  end
end
