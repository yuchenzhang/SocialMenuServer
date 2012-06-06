require 'spec_helper'

describe Review do
  it { should belong_to :dish}
  it { should belong_to :user}
  it { should belong_to :order}
  it { should validate_presence_of :dish}
  it { should validate_presence_of :user}
  it { should_not allow_value('i'*150).for(:comment)}
  it { should allow_value('i'*140).for(:comment)}
end
