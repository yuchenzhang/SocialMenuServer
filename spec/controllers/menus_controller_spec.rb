require 'spec_helper'

describe MenusController do

  describe "should return a restaurant json given a valid uuid" do
    before do
      @resto = create(:restaurant)
      @table = create(:table, :restaurant => @resto)
    end
    
    it "should return status bad request if the given uuid is not valid" do
      get 'show', :id => 1
      assert_response :bad_request
    end
    
    it "should return success if the given uuid is not an existing uuid" do
      get 'show', :id => UUID.new.generate
      assert_response :not_found
    end
    
    it "should return the restaurant json object if the given uuid is the one of a restaurant" do
      get 'show', :id => @resto.uuid
      response.body.should eql @resto.to_json 
      puts response.body
    end
    
    it "should return the restaurant json object if the given uuid is the one of a table with the specific table number" do
      get 'show', :id => @table.uuid
      response.body.should eql @table.to_json
      puts response.body
    end                   
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
