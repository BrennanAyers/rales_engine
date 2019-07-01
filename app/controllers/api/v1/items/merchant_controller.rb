class Api::V1::Items::MerchantController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.joins(:items).where(items: {id: params[:id]}).take)
  end
end
