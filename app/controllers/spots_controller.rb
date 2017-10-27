class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.name
    end
  end
  def show
  end

  def new
    @spot = Spot.new
  end
  def edit
  end

  def create
    @spot = Spot.new(spot_params)

    respond_to do |format|
      if @spot.save
        format.html{ redirect_to @spot, notice: 'Your Spot was successfully added!'}
        format.json{ render :show, status: :created, location: @spot}
      else
        format.html{ render :new}
        format.json{ render json: @spot.errors, status: :unprocessable_event}
      end
    end
  end

  def update
    @spot = Spot.new(spot_params)

    respond_to do |format|
      if @spot.update(spot_params)
        format.html{ redirect_to @spot, notice: 'Your Spot was successfully added!'}
        format.json{ render :show, status: :ok, location: @spot}
      else
        format.html{ render :new}
        format.json{ render json: @spot.errors, status: :unprocessable_event}
      end
    end
  end
end
