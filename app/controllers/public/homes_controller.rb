class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, only:[:top]
  def top
  end

  def about
  end
end
