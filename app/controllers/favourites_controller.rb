class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def create
    @car = Car.find(params[:car_id])
    @favourite = Favourite.new(favourite_params)
    @favourite.car = @car
    @favourite.save
    redirect_to car_path(@car)
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    @favourite.destroy
    redirect_to favourites_path
  end

  private

  def favourite_params
    params.require(:favourite).permit(:car_id)
  end
end
