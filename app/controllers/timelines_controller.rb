class TimelinesController < ApplicationController
  before_filter :authenticate_user!
  def show
    @reviews = Review.all(:order => 'created_at desc')
    render
  end
end
