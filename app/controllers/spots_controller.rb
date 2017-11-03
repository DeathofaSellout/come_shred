class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  # GET /spots
  # GET /spots.json
  def index
    @spot = Spot.new
    @spots = Spot.all
    @hash = Gmaps4rails.build_markers(@spots) do |spot, marker|
      marker.lat spot.latitude
      marker.lng spot.longitude
      marker.infowindow spot.name
    end
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
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

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    @spot = Spot.new(spot_params)

    respond_to do |format|
      if @spot.update(spot_params)
        format.html{ redirect_to @spot}
        format.json{ render :show, status: :ok, location: @spot}
      else
        format.html{ render :new}
        format.json{ render json: @spot.errors, status: :unprocessable_event}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url }
      format.json { head :no_content }
    end
  end

  private
   # Use callbacks to share common setup or constraints between actions.
   def set_spot
     @spot = Spot.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def spot_params
     params.require(:spot).permit(:latitude, :longitude, :address, :description, :name, :features, :comments)
   end
end
