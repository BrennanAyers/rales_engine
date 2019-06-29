class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: TotalRevenueSerializer.new(Merchant.revenue(params["date"]))
  end

  def show
    merchant = Merchant.find(params[:id])
    render json: RevenueSerializer.new(merchant.revenue(params["date"]))
  end
end
