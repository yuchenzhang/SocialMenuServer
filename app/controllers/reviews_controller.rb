class ReviewsController < ApplicationController
  def index
    @reviews = Dish.find(params[:dish_id]).reviews
    render 
  end

  def show
    @review = Review.find(params[:id])
    render
  end

  def create
    if params[:picture_binary]
      picture_data = StringIO.new(Base64.decode64 params[:picture_binary])
      picture_data.class.class_eval { attr_accessor :original_filename, :content_type }
      picture_data.original_filename = "review.png#{Time.now.to_i}_#{params[:user_id]}_#{params[:dish_id]}"
      picture_data.content_type = "image/png"
    end
    @review = Review.new(:user_id => params[:user_id], 
      :dish_id => params[:dish_id],
      :comment => params[:comment])
    @review.picture = picture_data if picture_data
    @review.save!
    render :status => :created
  end

  def destroy
  end
end
