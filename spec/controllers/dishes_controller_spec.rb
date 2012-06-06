require 'spec_helper'

describe DishesController do
  include Devise::TestHelpers
  describe 'show' do
    before do
      user = create :user
      sign_in user
      @dish = create :dish
      @review = create :review, :user => user, :dish => @dish
    end
    it 'should return not_found when given id is not valid or existing' do
      get 'show', :id => '-1', :format => :json
      assert_response :not_found
    end
    it 'should return success when given id is valid and existing' do
      get 'show', :id => @dish.id, :format => :json
      assert_response :success
    end
    it 'should return a json containing id,name,price and description' do
      get 'show', :id => @dish.id, :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['id'] == @dish.id
        json['name'] == @dish.name
        json['price'] == @dish.price
        json['description'] == @dish.description
      end
    end
    it 'should return a json containing the review array' do
      get 'show', :id => @dish.id, :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['reviews'].count == 1
        json['reviews'][0]['id'] == @review.id
        json['reviews'][0]['comment'] == @review.comment
      end
    end 
  end

end
