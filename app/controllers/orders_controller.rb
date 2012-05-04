class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if params[:resto_id]
      begin
        resto = Restaurant.find params[:resto_id]
        @orders = resto.orders
        render
      rescue => e
        render :status => :not_found, :nothing => true 
        logger.error e.message
      end
    else
      @orders = Order.all
      render
    end
  end

  def show
    begin
      @order = Order.find params[:id]
      render
    rescue => e
      render :status => :not_found, :error => e.message
      logger.error e.message
    end
  end

  def create
    begin
      @order = Order.create!(
        :restaurant => Restaurant.find(params[:restaurant_id]), 
        :user => User.find(params[:user_id]))
      @order.dishes << Dish.find(params[:dishes].map{|d|d['id']})
      render :status => :created
    rescue => e
      render :status => :unprocessable_entity, :text => e.message
      logger.error e.message
    end
  end
  
  def update
    
  end
end
