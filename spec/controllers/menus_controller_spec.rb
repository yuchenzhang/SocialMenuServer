require 'spec_helper'

describe MenusController do
  include Devise::TestHelpers 
  describe "should return a restaurant json given a valid uuid" do
    before do
      @user = create :user
      sign_in @user
      @resto = create(:restaurant)
      @table = create(:table, :restaurant => @resto)
      @dish = create(:dish, :restaurant => @resto)
      @dish.add_picture_from_file File.open(File.join(Rails.root, "tmp/tapas.jpg"))
    end
    
    it "should return status bad request if the given uuid is not valid" do
      get 'show', :id => 1, :format => :json
      assert_response :bad_request
    end
    
    it "should return success if the given uuid is not an existing uuid" do
      get 'show', :id => UUID.new.generate, :format => :json
      assert_response :not_found
    end                            
                                            
    describe "should return the restaurant json object if the given uuid is the one of a restaurant" do
      let(:json_response) do
        get 'show', :id => @resto.uuid, :format => :json
        JSON.parse response.body
      end
      
      it "should not include the id, created and updated timestamp, city_id" do
        json_response.has_key?('id').should be_false
        json_response.has_key?('created_at').should be_false
        json_response.has_key?('updated_at').should be_false
        json_response.has_key?('city_id').should be_false
      end
      it "should include the name, the address lines and the geo location" do
        json_response.has_key?('name').should be_true
        json_response.has_key?('address_line_1').should be_true
        json_response.has_key?('address_line_2').should be_true
        json_response.has_key?('latitude').should be_true
        json_response.has_key?('longitude').should be_true
      end
      it "should include the city hash" do
        json_response.has_key?('city').should be_true
        assert json_response['city'].is_a? String
      end
      
      describe "should include the array of dishes" do
        it "should contain the dish array" do
          json_response.has_key?('dishes').should be_true
          assert json_response['dishes'].is_a? Array
        end
        let(:dish_json) do
          json_response['dishes'].first
        end
        it "should contain the dish name, description and price" do
          dish_json.has_key?('name').should be_true
          dish_json.has_key?('price').should be_true
          dish_json.has_key?('description').should be_true
        end
        it "should contain the press pictures array with urls" do
          dish_json.has_key?('pictures').should be_true
          dish_json['pictures'].is_a? Array
          dish_json['pictures'].first.has_key?("url").should be_true
        end
      end
      
    end
    
    describe "should return the restaurant json object if the given uuid is the one of a table with the specific table number" do
      let(:json_response) do
        get 'show', :id => @table.uuid, :format => :json
        JSON.parse response.body
      end
      
      it "should contain the table number" do
        json_response.has_key?('table_number').should be_true
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
