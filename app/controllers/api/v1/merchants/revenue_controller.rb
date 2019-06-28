class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: RevenueSerializer.new(Merchant.revenue(params["date"]))
  end
end
