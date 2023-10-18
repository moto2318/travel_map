class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    # if @range == "Customer"
    #   @customers = Customer.looks(params[:search], params[:word])
    # else
      @maps = Map.looks(params[:word])
    # end
  end


end
