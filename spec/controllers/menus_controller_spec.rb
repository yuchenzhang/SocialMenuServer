require 'spec_helper'

describe MenusController do
  include Devise::TestHelpers 
  describe "show" do
    before do
      @restaurant = create :restaurant
      @table = create :table, :restaurant => @restaurant
      sign_in create :user                                                
    end
    
    it "should return not_found if the given uuid is not an existing uuid" do
      get 'show', :id => UUID.new.generate, :format => :json
      assert_response :not_found
    end                            
    it 'should return success if the given uuid is of an registered restaurant' do
      get 'show', :id => @restaurant.uuid, :format => :json
      assert_response :success
    end
    it 'should return success if the given uuid is of an registered table' do
      get 'show', :id => @table.uuid, :format => :json
      assert_response :success
    end
    it 'should return the json of the restaurant when success' do
      get 'show', :id => @restaurant.uuid, :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['id'] == @restaurant.id
        json['name'] == @restaurant.name
        json['address_line_1'] == @restaurant.address_line_1
        json['latitude'] == @restaurant.latitude.to_s
      end
    end
    it 'should return the json of the table when success' do
      get 'show', :id => @table.uuid, :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['table_number'] == @table.number
        json['restaurant']['id'] == @restaurant.id
      end
    end                                                          
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
