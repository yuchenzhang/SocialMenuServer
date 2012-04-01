class RestaurantsController < ApplicationController
  def show
    if UUID.validate params[:id]
      resto = Restaurant.find_by_uuid params[:id]
      if resto 
        render :json => resto
      else
        render :status => :not_found
      end
    else
      render :status => :bad_request, :text => "invalid restaurant id"
    end
  end

  def index
  end

  def edit
  end

end
