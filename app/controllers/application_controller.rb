class ApplicationController < ActionController::Base
  # protect_from_forgery
  #    
  private
  def authenticate_user!
    if params[:authentication_token] and user = User.find_by_authentication_token(params[:authentication_token]) 
      sign_in user
    else
      super
    end
  end
end
