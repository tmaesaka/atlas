class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.where(public: true).page(params[:page])

    render json: @checkins
  end

  def create
    return render_400(msg: 'place_id required') unless params[:place_id]

    @place   = Place.find_by! external_id: params[:place_id]
    @checkin = Checkin.new place: @place

    if @checkin.invalid?
      render json: @checkin.errors, status: :bad_request
      return
    end

    @checkin.save!

    render json: @checkin
  end
end