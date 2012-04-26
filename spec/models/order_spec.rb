require 'spec_helper'

describe Order do
  it { should have_db_column 'user_id'}
  it { should belong_to :restaurant}
  it { should have_and_belong_to_many :dishes}
end
