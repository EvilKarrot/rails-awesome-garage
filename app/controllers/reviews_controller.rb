class ReviewsController < ApplicationController
  before_action :set_car, only: [:create]

  def create
    @review = @car.reviews.new(review_params)
    if @review.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params{:id})
    @review.destroy
    redirect_to car_path(@car)
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
