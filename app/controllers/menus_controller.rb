class MenusController < ApplicationController
  def show
    if UUID.validate params[:id]
      if table = (Table.find_by_uuid params[:id])
        res = table 
      else
        res = Restaurant.find_by_uuid params[:id]
      end
      if res  
        render :json => res                  
      else
        render :status => :not_found
      end
    else
      render :status => :bad_request, :text => "invalid restaurant id"
    end
  end

  def index
  end

end
