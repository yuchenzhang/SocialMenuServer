require 'spec_helper'

describe OrdersController do
  include Devise::TestHelpers
  describe "routes" do
    it { should route(:get, "/orders.json").to(:controller => :orders, :action => :index, :format => 'json')}
    it { should route(:get, "/restaurant/1/orders.json").to(:controller => :orders, :action => :index, :resto_id => 1, :format => 'json')}
    it { should route(:post,"/orders.json").to(:controller => :orders, :action => :create, :format => 'json')}
    it { should route(:get, "/orders/1.json").to(:controller => :orders, :action => :show, :id => 1, :format => 'json')}
    it { should route(:put, "/orders/1.json").to(:controller => :orders, :action => :update, :id => 1, :format => 'json')}
  end
  
  context "without authentication" do
    describe "cannot get all orders" do
      before do
        get "index", :format => 'json'
      end
      it { should respond_with :unauthorized }               
    end
  end
  
  context "with authentication" do
    before do
      @user = create :user
      create :order, :user => @user, :restaurant => (create :restaurant, :name => "soho1", :uuid => 'xxx')
      create :order, :user => @user, :restaurant => (create :restaurant, :name => "soho2", :uuid => 'yyy')
      sign_in @user
    end
    context "get all orders" do
      before do
        get "index", :format => 'json'
      end
      it { should respond_with :success}
      it "should return 2 orders" do
        results = JSON.parse response.body
        results.size.should == 2 
      end
    end
    context "get orders of a restaurant" do
      before do
        get 'index', :resto_id => Restaurant.last.id, :format => 'json'
      end
      it { should respond_with :success}
      it "should return only one order of the last restaurant" do
        results = JSON.parse response.body
        results.size.should == 1
      end
    end
    context "get orders with a wrong/invalid restaurant id" do
      before do
        get 'index', :resto_id => 'xxx', :format => 'json'
      end
      it { should respond_with :not_found}
    end
    context "show a particular order given a valid order id" do
      before do
        get 'show', :id => Order.first.id, :format => 'json'
      end
      it { should respond_with :success}
    end
  end
end
