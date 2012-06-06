require 'spec_helper'

describe ReviewsController do
  include Devise::TestHelpers
  before do             
    @review = create :review
    sign_in @review.user
  end
  
  describe 'index' do
    it 'should return not_found when given dish id is not valid or existing' do
      get 'index', :dish_id => '-1', :format => :json
      assert_response :not_found
    end
    it 'should return success when given dish id is valid and existing' do
      get 'index', :dish_id => @review.dish.id, :format => :json
      assert_response :success
    end
    it 'should return a json with array of dishes' do
      get 'index', :dish_id => @review.dish.id, :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json.count == 1
        json[0]['id'] == @review.id
      end
    end
  end
  
  describe 'show' do
    it 'should return not_found when given dish id is not valid or existing' do
      get 'show', :dish_id => '-1', :format => :json
      assert_response :not_found
    end
    it 'should return not_found when given id is not valid or existing' do
      get 'show', :dish_id => @review.dish_id, :id => '0', :format => :json
      assert_response :not_found
    end
    it 'should return success when the given id is valid and existing' do
      get 'show', :dish_id => @review.dish_id, :id => @review.id, :format => :json
      assert_response :success
    end
    it 'should return success when the given id is -1, meaning retrieving the latest one' do
      get 'show', :dish_id => @review.dish_id, :id => '-1', :format => :json
      assert_response :success
    end
    it 'should return a review json with id and comment' do
      get 'show', :dish_id => @review.dish_id, :id => '-1', :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['id'] == @review.id
        json['comment'] == @review.comment
      end
    end
  end
  
  describe 'create' do
    it 'should return unprocessable_entity when given dish is not valid or existing' do
      post 'create', :dish_id => '-1', :comment => 'blalbla', :format => :json
      assert_response :unprocessable_entity
    end
    it 'should return created when given dish id is valid and existing' do
      post 'create', :dish_id => @review.dish_id, :comment => 'blalbla', :format => :json
      assert_response :created
    end
    it 'should create a new review when return created' do
      post 'create', :dish_id => @review.dish_id, :comment => 'blalbla', :format => :json
      Review.last.id.should == @review.id + 1
    end
    it 'should return the json of the new review when return created' do
      post 'create', :dish_id => @review.dish_id, :comment => 'blalbla', :format => :json
      JSON.parse(response.body).should satisfy do |json|
        new_review = Review.last
        json['id'] == new_review.id
        json['comment'] == new_review.comment
      end
    end 
  end
  
  describe 'update' do
    it 'should return not_found when given review id is not valid or existing' do
      put 'update', :id => '-1', :comment => 'somethingnew', :format => :json
      assert_response :not_found
    end
    it 'should return success when given review id is valid' do
      put 'update', :id => @review.id, :comment => 'somethingnew', :format => :json
      assert_response :success
    end
    it 'should update the comment when return success' do
      put 'update', :id => @review.id, :comment => 'somethingnew', :format => :json
      @review.reload.comment.should == 'somethingnew'
    end
    it 'should return the json of the updated review' do
      put 'update', :id => @review.id, :comment => 'somethingnew', :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['id'] == @review.id
        json['comment'] == 'somethingnew'
      end
    end
  end
             
end
