class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if params[:resto_id]
      begin
        resto = Restaurant.find params[:resto_id]
        @orders = resto.orders
        render "index"
      rescue => e
        render :status => :not_found, :nothing => true 
        logger.error e.message
      end
    else
      @orders = Order.all
      render 'index'
    end
  end

  def show
    begin
      @order = Order.find params[:id]
      render 'show'
    rescue => e
      render :status => :not_found, :nothing => true
      logger.error e.message
    end
  end

  def create
  end
  
  def update
    
  end
end
