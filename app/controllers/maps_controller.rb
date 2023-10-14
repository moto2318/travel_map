class MapsController < ApplicationController
  before_action :set_map, only: %i[ show edit update destroy ]


  def map
    @maps = Map.all
  end
  # GET /maps or /maps.json
  def index
    @maps = Map.all
  end

  # GET /maps/1 or /maps/1.json
  def show
    # @post = Post.find(params[:id])
    # render json: @post
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
    @map = Map.find(params[:id])
  end

  # POST /maps or /maps.json
  def create
    @map = Map.create(map_params)
    if @map.save
      redirect_to maps_path, notice: 'Map was successfully created.'
    elsif
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /maps/1 or /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to map_url(@map), notice: "Map was successfully updated." }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1 or /maps/1.json
  def destroy
    @map.destroy

    respond_to do |format|
      format.html { redirect_to maps_url, notice: "Map was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def map_params
      params.permit(:lat, :lng, :text, :title, :address)
    end
end