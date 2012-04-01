require 'spec_helper'

describe RestaurantsController do

  describe "should return a restaurant json given a valid uuid" do
    before do
      @resto = FactoryGirl.create(:restaurant)
    end
    
    it "should return status bad request if the given uuid is not valid" do
      get 'show', :id => @resto.id
      assert_response :bad_request
    end
    
    it "should return success if the given uuid is not an existing uuid" do
      get 'show', :id => UUID.new.generate
      assert_response :not_found
    end
    
    it "should return a json object if the given uuid is valid and existing" do
      get 'show', :id => @resto.uuid
      response.body.should eql @resto.to_json
    end 
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end

end
