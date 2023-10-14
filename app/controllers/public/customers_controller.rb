class Public::CustomersController < ApplicationController
  
  def index
    @lists = Map.all
  end
  
  
  def show
    @list = Map.find(params[:id])
  end
  
  def edit
    @list = Map.find(params[:id])
  end
  
  def update
    
  end
  
  def confirm
    
  end
  
  def withdrawal
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def map_params
      params.require(:map).permit(:lat, :lng, :text)
    end
end
