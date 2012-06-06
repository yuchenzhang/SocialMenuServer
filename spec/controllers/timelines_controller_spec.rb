require 'spec_helper'

describe TimelinesController do
  include Devise::TestHelpers
  before do
    @review = create :review
    sign_in @review.user
  end
  describe 'show' do
    it 'should return a json containing array of all reviews' do
      get 'show', :format => :json
      JSON.parse(response.body).should satisfy do |json|
        json['reviews'].count == 1
        json['reviews'][0]['id'] == @review.id
      end
    end
  end
end
