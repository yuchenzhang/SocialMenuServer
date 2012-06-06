require 'spec_helper'

describe Order do
  it { should belong_to :user}
  it { should belong_to :restaurant}
  it { should have_and_belong_to_many :dishes}
  it { should validate_presence_of :user}
  it { should validate_presence_of :restaurant}
  it { should_not allow_value('created').for :status}
  it { should_not allow_mass_assignment_of :status}
  
  describe "add status" do
    let(:new_order) do
      Order.create!(:user => (create :user), :restaurant => (create :restaurant))
    end
    it "should have status pending" do
      new_order.status.should == "pending"
    end
  end
end
