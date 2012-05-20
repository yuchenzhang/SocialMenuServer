class DishesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  def show
    @dish = Dish.find params[:id]
    render
  end
end
