class Public::CustomersController < ApplicationController

  def index
    @coustomer = current_customer
    @lists = Map.all
  end
  
  def mypage
    @maps = current_customer.maps
  end

  def edit
    @customer = current_customer
  end

  def update
     @customer = current_customer
    if @customer.update(customer_params)
      redirect_to  mypage_customers_path
    else
      render :edit
    end
  end

  def confirm

  end

  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

    def customer_params
      params.require(:customer).permit(:name, :email, :is_deleted)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def map_params
      params.require(:map).permit(:lat, :lng, :text)
    end
end
