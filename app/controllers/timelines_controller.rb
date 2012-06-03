class TimelinesController < ApplicationController
  def show
    @reviews = Review.all(:order => 'created_at desc')
    render
  end
end
