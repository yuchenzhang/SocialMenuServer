class MenusController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def show
    begin
      @resto = Table.find_by_uuid params[:id]
      @resto ||= Restaurant.find_by_uuid params[:id]
      raise unless @resto                   
      render
    rescue => e
      render :status => :not_found, :nothing => true
    end
  end

  def index
  end
  
end
