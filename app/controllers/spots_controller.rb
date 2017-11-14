class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spot = Spot.new
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
        format.html{ redirect_to spots_url}
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
        #redirect_to @spot
        format.html{ redirect_to spots_url}
        format.json{ render :show, status: :ok, location: @spot}
      else
        format.html{ render :new}
        format.json{ render json: @spot.errors, status: :unprocessable_event}
      end
    end
  end

  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url }
      format.json { head :no_content }
    end
  end

  private
   def set_spot
     @spot = Spot.find(params[:id])
   end

   def spot_params
     params.require(:spot).permit(:latitude, :longitude, :address, :description, :name, :features, :comments)
   end
end
