class ReviewsController < ApplicationController
  def index
    begin 
      @reviews = Dish.find(params[:dish_id]).reviews
      render
    rescue => e
      render :status => :not_found, :nothing => true
    end 
  end

  def show
    begin
      dish = Dish.find params[:dish_id]                            
      if params[:id] == '-1'
        @review = dish.reviews.first
      else
        @review = dish.reviews.find params[:id]
      end 
      render
    rescue => e
      render :status => :not_found, :nothing => true
    end
  end

  def create
    begin
      if params[:picture_binary]
        picture_data = StringIO.new(Base64.decode64 params[:picture_binary])
        picture_data.class.class_eval { attr_accessor :original_filename, :content_type }
        picture_data.original_filename = "review.png#{Time.now.to_i}_#{params[:user_id]}_#{params[:dish_id]}"
        picture_data.content_type = "image/png"
      end
      @review = Review.new(:user_id => current_user.id, 
        :dish_id => params[:dish_id],
        :comment => params[:comment])
      @review.picture = picture_data if picture_data
      @review.save!
      render :status => :created
    rescue => e
      render :status => :unprocessable_entity, :nothing => true
    end
  end
  
  def update
    begin
      @review = Review.find params[:id]
      @review.update_attributes(:comment => params[:comment])
      render 'show'
    rescue => e
      render :status => :not_found, :nothing => true
    end
  end
  
end
