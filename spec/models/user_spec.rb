require 'spec_helper'

describe User do
  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it {should_not allow_value('gmail.com').for :email }
  it {should allow_value('jack@gmail.com').for :email}
  it {should validate_presence_of :password}
  it {should_not allow_value('1234').for :password}
  it {should allow_value('123456abc').for :password}
end
