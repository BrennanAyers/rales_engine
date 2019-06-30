class Api::V1::Merchants::FindController < ApplicationController
  def show
    finders = [:id, :name, :created_at, :updated_at]
    first_finder = finders.map {|key| key if params[key]}.compact.first
    merchant = Merchant.find_by(first_finder => params[first_finder])
    render json: MerchantSerializer.new(merchant)
  end
end
