class Api::V1::Invoices::MerchantController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.joins(:invoices).where(invoices: {id: params[:id]}).take)
  end
end
