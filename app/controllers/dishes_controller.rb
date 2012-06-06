class DishesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  def show
    begin
      @dish = Dish.find params[:id]
      render
    rescue => e
      render :status => :not_found
    end
  end
end
