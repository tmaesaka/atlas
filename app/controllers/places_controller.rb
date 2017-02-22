class PlacesController < ApplicationController
  def create
    @place = Place.new place_params

    if @place.invalid?
      render json: @place.errors, status: :bad_request
      return
    end

    @place.save

    render json: @place
  end

  private

  def place_params
    params.permit %i(name)
  end
end
