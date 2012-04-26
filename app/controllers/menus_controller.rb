class MenusController < ApplicationController
  before_filter :authenticate_user!
  def show
    if UUID.validate params[:id]
      if table = (Table.find_by_uuid params[:id])
        @resto = table 
      else
        @resto = Restaurant.find_by_uuid params[:id]
      end
      @resto ||= Table.first
      if @resto  
        render "menus/show"                  
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
